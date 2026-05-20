#!/usr/bin/env bash
# update-readme.sh — Sync the ## Packages table in README.md with index/packages.tsv.
# Adds new packages, removes deleted ones, preserves existing rows, re-sorts alphabetically.

set -euo pipefail

README="README.md"
TSV="index/packages.tsv"

[[ ! -f "$TSV" ]]    && { echo "ERROR: ${TSV} not found";    exit 1; }
[[ ! -f "$README" ]] && { echo "ERROR: ${README} not found"; exit 1; }

declare -A PKG_SUITES PKG_ARCHES PKG_HOMEPAGE

while read -r suite arch name version url size md5 sha1 sha256 ctrl channel_raw; do
  channel="${channel_raw:-stable}"
  [[ "$channel" != "stable" ]] && continue

  PKG_SUITES[$name]="${PKG_SUITES[$name]:-} $suite"
  PKG_ARCHES[$name]="${PKG_ARCHES[$name]:-} $arch"

  if [[ -z "${PKG_HOMEPAGE[$name]:-}" && -n "${ctrl:-}" ]]; then
    hp=$(echo "$ctrl" | base64 -d 2>/dev/null \
      | awk '/^Homepage: /{ sub(/^Homepage: /, ""); print; exit }')
    PKG_HOMEPAGE[$name]="${hp:-}"
  fi
done < "$TSV"

# Normalize to sorted, comma-separated lists.
for name in "${!PKG_SUITES[@]}"; do
  mapfile -t _s < <(echo "${PKG_SUITES[$name]}" | tr ' ' '\n' | sort -u | grep -v '^$')
  mapfile -t _a < <(echo "${PKG_ARCHES[$name]}"  | tr ' ' '\n' | sort -u | grep -v '^$')
  _joined_s="${_s[*]}"; PKG_SUITES[$name]="${_joined_s// /, }"
  _joined_a="${_a[*]}"; PKG_ARCHES[$name]="${_joined_a// /, }"
done

# Read rows from the ## Packages section only, ignoring other tables.
declare -A EXISTING_ROWS
while IFS= read -r row; do
  pkg=$(echo "$row" | grep -oP '^\| `\K[^`]+' || true)
  [[ -n "${pkg:-}" ]] && EXISTING_ROWS[$pkg]="$row"
done < <(awk '/^## Packages/{found=1; next} found && /^## /{exit} found' "$README" \
         | grep -P '^\| `' || true)

changed=false

for pkg in "${!PKG_SUITES[@]}"; do
  if [[ -z "${EXISTING_ROWS[$pkg]:-}" ]]; then
    echo "Adding to README: ${pkg}"
    changed=true
  fi
done

for pkg in "${!EXISTING_ROWS[@]}"; do
  if [[ -z "${PKG_SUITES[$pkg]:-}" ]]; then
    echo "Removing from README: ${pkg}"
    changed=true
  fi
done

if [[ "$changed" == "false" ]]; then
  echo "README packages table is up to date."
  exit 0
fi

# Merge: keep existing rows as-is, generate new rows for added packages.
declare -A FINAL_ROWS

for pkg in "${!PKG_SUITES[@]}"; do
  if [[ -n "${EXISTING_ROWS[$pkg]:-}" ]]; then
    FINAL_ROWS[$pkg]="${EXISTING_ROWS[$pkg]}"
  else
    hp="${PKG_HOMEPAGE[$pkg]:-}"
    if [[ -n "$hp" ]]; then
      upstream="[${pkg}](${hp})"
    else
      upstream="${pkg}"
    fi
    FINAL_ROWS[$pkg]="| \`${pkg}\` | ${upstream} | ${PKG_SUITES[$pkg]} | ${PKG_ARCHES[$pkg]} |"
  fi
done

TEMP_TABLE=$(mktemp)
TEMP_README=$(mktemp)
trap 'rm -f "$TEMP_TABLE" "$TEMP_README"' EXIT

{
  echo "| Package | Upstream | Suites | Architectures |"
  echo "|---|---|---|---|"
  mapfile -t SORTED_PKGS < <(printf '%s\n' "${!FINAL_ROWS[@]}" | sort)
  for pkg in "${SORTED_PKGS[@]}"; do
    echo "${FINAL_ROWS[$pkg]}"
  done
} > "$TEMP_TABLE"

# Replace the table from its header row to the last table line, then emit the sorted table.
awk -v table_file="$TEMP_TABLE" '
  /^\| Package \| Upstream \| Suites \| Architectures \|$/ {
    while ((getline line < table_file) > 0) print line
    close(table_file)
    in_table = 1
    next
  }
  in_table && /^\|/ { next }
  in_table           { in_table = 0 }
  { print }
' "$README" > "$TEMP_README"

mv "$TEMP_README" "$README"
echo "README packages table updated."
