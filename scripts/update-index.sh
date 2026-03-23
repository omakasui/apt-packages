#!/usr/bin/env bash
# update-index.sh — Generate Packages/Packages.gz/Packages.xz files
# for every suite and arch by reading index/packages.tsv.
#
# The Filename field is set to a pool-relative path (pool/<tag>/<file>).
# A Cloudflare Worker on packages.omakasui.org redirects pool/ requests
# to the matching GitHub Releases asset in omakasui/build-apt-packages.
#
# Usage:
#   update-index.sh --suites "<suite1> <suite2>"
#
# TSV format (v2): <suite> <arch> <name> <version> <url> <size> <md5> <sha1> <sha256> <control_b64> [<channel>]
# Legacy format (v1): same but without <control_b64> (9 fields). Absent channel defaults to 'stable'.
#
# Dev fallback: the *-dev Packages file includes all stable packages as a base,
# overridden by dev-channel entries when present. This ensures users on the dev
# channel always have access to every package, not just those explicitly tagged dev.

set -euo pipefail

SUITES=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --suites) SUITES="$2"; shift 2 ;;
    *) echo "ERROR: unknown argument: $1" >&2; exit 1 ;;
  esac
done

[[ -z "$SUITES" ]] && { echo "ERROR: --suites is required"; exit 1; }
[[ ! -f index/packages.tsv ]] && { echo "ERROR: index/packages.tsv not found"; exit 1; }

for suite in $SUITES; do
  for arch in amd64 arm64; do
    stable_dir="dists/${suite}/main/binary-${arch}"
    dev_dir="dists/${suite}-dev/main/binary-${arch}"
    mkdir -p "$stable_dir" "$dev_dir"
    : > "${stable_dir}/Packages"
    : > "${dev_dir}/Packages"

    # Collect the set of package names that have an explicit dev entry for this
    # suite+arch, so stable fallback entries are skipped for those.
    declare -A _dev_pkgs=()
    while IFS=' ' read -r s a name _rest; do
      [[ "$s" != "$suite" ]] && continue
      [[ "$a" != "$arch" && "$a" != "all" ]] && continue
      _chan=$(echo "$_rest" | awk '{print $NF}')
      [[ "$_chan" == "dev" ]] && _dev_pkgs["${a}:${name}"]=1
    done < index/packages.tsv

    while IFS=' ' read -r s a name version url size md5 sha1 sha256 control_b64 entry_channel _ignored; do
      [[ "$s" != "$suite" ]] && continue
      # Include arch-specific entries and arch:all entries for every arch.
      [[ "$a" != "$arch" && "$a" != "all" ]] && continue

      _chan="${entry_channel:-stable}"

      # Route to stable or dev Packages file.
      # Stable entries are also written to dev as a fallback, unless an explicit
      # dev entry already exists for this package+arch (in which case the dev
      # entry will be written instead when its turn comes).
      if [[ "$_chan" == "dev" ]]; then
        pkg_dir="$dev_dir"
      else
        pkg_dir="$stable_dir"
      fi

      # Convert a full GitHub Releases URL to a pool-relative path.
      # https://github.com/OWNER/REPO/releases/download/TAG/FILE -> pool/TAG/FILE
      # This is required because apt always treats Filename as a path relative
      # to the repository base URL — absolute URLs result in a double-URL fetch.
      # Requests to pool/ are redirected to GitHub Releases by the Cloudflare Worker.
      if [[ "$url" == https://github.com/*/releases/download/*/* ]]; then
        _tag="${url%/*}"
        _tag="${_tag##*/}"
        _file="${url##*/}"
        url="pool/${_tag}/${_file}"
      fi

      if [[ -n "${control_b64:-}" ]] && _control=$(printf '%s' "$control_b64" | base64 -d 2>/dev/null) && [[ "$_control" == *":"* ]]; then
        # v2 entry: decoded control stanza contains field headers (e.g. "Maintainer:").
        # Write Package/Version/Architecture first (authoritative from TSV).
        _write_entry() {
          local dir="$1"
          printf "Package: %s\n"      "$name"    >> "${dir}/Packages"
          printf "Version: %s\n"      "$version" >> "${dir}/Packages"
          printf "Architecture: %s\n" "$a"       >> "${dir}/Packages"
          printf '%s\n' "$_control" | grep -v -E \
            '^(Package|Version|Architecture):' >> "${dir}/Packages"
          printf "Filename: %s\n" "$url"    >> "${dir}/Packages"
          printf "Size: %s\n"    "$size"   >> "${dir}/Packages"
          printf "MD5sum: %s\n"  "$md5"    >> "${dir}/Packages"
          printf "SHA1: %s\n"   "$sha1"   >> "${dir}/Packages"
          printf "SHA256: %s\n" "$sha256"  >> "${dir}/Packages"
          printf "\n"                       >> "${dir}/Packages"
        }
        _write_entry "$pkg_dir"
        # Stable entries also go to dev as fallback (unless a dev entry exists).
        if [[ "$_chan" == "stable" && -z "${_dev_pkgs["${a}:${name}"]:-}" ]]; then
          _write_entry "$dev_dir"
        fi
      else
        # Legacy v1 entry (no control stanza): minimal output.
        _write_legacy() {
          local dir="$1"
          printf "Package: %s\nVersion: %s\nArchitecture: %s\nFilename: %s\nSize: %s\nMD5sum: %s\nSHA1: %s\nSHA256: %s\n\n" \
            "$name" "$version" "$a" "$url" "$size" "$md5" "$sha1" "$sha256" \
            >> "${dir}/Packages"
        }
        _write_legacy "$pkg_dir"
        if [[ "$_chan" == "stable" && -z "${_dev_pkgs["${a}:${name}"]:-}" ]]; then
          _write_legacy "$dev_dir"
        fi
      fi
    done < index/packages.tsv

    unset _dev_pkgs

    for dir in "$stable_dir" "$dev_dir"; do
      gzip -k -f "${dir}/Packages"
      xz   -k -f "${dir}/Packages"
      echo "Generated: ${dir}/Packages ($(grep -c '^Package:' "${dir}/Packages") entries)"
    done
  done
done