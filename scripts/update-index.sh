#!/usr/bin/env bash
# update-index.sh — Generate Packages/Packages.gz/Packages.xz files
# for every suite and arch by reading index/packages.tsv.
#
# The Filename field is set to the full GitHub Releases URL so that
# apt downloads binaries directly from GitHub without any proxy.
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

    while IFS=' ' read -r s a name version url size md5 sha1 sha256; do
      [[ "$s" != "$suite" ]] && continue
      # Include arch-specific entries and arch:all entries for every arch.
      [[ "$a" != "$arch" && "$a" != "all" ]] && continue

      printf "Package: %s\nVersion: %s\nArchitecture: %s\nFilename: %s\nSize: %s\nMD5sum: %s\nSHA1: %s\nSHA256: %s\n\n" \
        "$name" "$version" "$a" "$url" "$size" "$md5" "$sha1" "$sha256" \
        >> "${pkg_dir}/Packages"
    done < index/packages.tsv

    gzip -k -f "${pkg_dir}/Packages"
    xz   -k -f "${pkg_dir}/Packages"
    echo "Generated: ${pkg_dir}/Packages ($(grep -c '^Package:' "${pkg_dir}/Packages") entries)"
  done
done