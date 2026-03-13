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
# TSV format: <suite> <arch> <name> <version> <url> <size> <md5> <sha1> <sha256>

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
    pkg_dir="dists/${suite}/main/binary-${arch}"
    mkdir -p "$pkg_dir"
    : > "${pkg_dir}/Packages"

    while IFS=' ' read -r s a name version url size md5 sha1 sha256 installed_size _rest; do
      [[ "$s" != "$suite" ]] && continue
      # Include arch-specific entries and arch:all entries for every arch.
      [[ "$a" != "$arch" && "$a" != "all" ]] && continue

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

      {
        printf "Package: %s\n"      "$name"
        printf "Version: %s\n"      "$version"
        printf "Architecture: %s\n" "$a"
        [[ -n "$installed_size" ]] && printf "Installed-Size: %s\n" "$installed_size"
        printf "Filename: %s\n"     "$url"
        printf "Size: %s\n"         "$size"
        printf "MD5sum: %s\n"       "$md5"
        printf "SHA1: %s\n"         "$sha1"
        printf "SHA256: %s\n"       "$sha256"
        printf "\n"
      } >> "${pkg_dir}/Packages"
    done < index/packages.tsv

    gzip -k -f "${pkg_dir}/Packages"
    xz   -k -f "${pkg_dir}/Packages"
    echo "Generated: ${pkg_dir}/Packages ($(grep -c '^Package:' "${pkg_dir}/Packages") entries)"
  done
done