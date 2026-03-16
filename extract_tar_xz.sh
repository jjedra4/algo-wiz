#!/usr/bin/env bash

set -euo pipefail

DATA_DIR="${1:-./data}"

if [[ ! -d "$DATA_DIR" ]]; then
  echo "Error: directory not found: $DATA_DIR" >&2
  echo "Usage: ./extract_tar_xz.sh [data-directory]" >&2
  exit 1
fi

shopt -s nullglob
archives=("$DATA_DIR"/*.tar.xz)

if (( ${#archives[@]} == 0 )); then
  echo "No .tar.xz files found in $DATA_DIR"
  exit 0
fi

for archive in "${archives[@]}"; do
  echo "Extracting: $archive"
  tar -xJf "$archive" -C "$DATA_DIR"
done

echo "Done. Extracted ${#archives[@]} archive(s) in $DATA_DIR"