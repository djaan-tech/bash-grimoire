#!/usr/bin/env bash

if (( $# != 2 )); then
  printf 'Usage: %s SOURCE DESTINATION\n' "$0" >&2
  exit 2
fi

if [[ ! -d $1 || -z $2 ]]; then
  printf 'Provide an existing source directory and a destination path.\n' >&2
  exit 2
fi

# Resolve symbolic links and keep any newlines in directory names.
if ! IFS= read -r -d '' source < <(realpath -ez -- "$1") ||
   ! IFS= read -r -d '' destination < <(realpath -mz -- "$2"); then
  printf 'Cannot resolve the source or destination.\n' >&2
  exit 2
fi

if [[ $source == / || $destination == "$source" || $destination == "$source/"* ]]; then
  printf 'The destination must be outside the source directory.\n' >&2
  exit 2
fi

if ! mkdir -p -- "$destination"; then
  exit 2
fi

if ! timestamp=$(date -u +%Y%m%dT%H%M%SZ) ||
   ! temporary=$(mktemp -- "$destination/.backup.XXXXXXXX"); then
  exit 2
fi

# Clean up the temporary file on success, failure or a handled signal.
trap 'rm -f -- "$temporary"' EXIT
trap 'exit 2' HUP INT TERM

parent=${source%/*}
name=${source##*/}
archive="$destination/backup-$timestamp.tar.gz"

# Use only the options listed here, even if TAR_OPTIONS is set in the caller.
if ! TAR_OPTIONS='' tar -czf "$temporary" -C "${parent:-/}" -- "$name"; then
  printf 'Backup failed for %s.\n' "$source" >&2
  exit 2
fi

# Publish the complete archive without replacing an existing file.
if ! ln -T -- "$temporary" "$archive"; then
  printf 'Cannot publish the archive at %s.\n' "$archive" >&2
  exit 2
fi

printf 'Backup created: %s\n' "$archive"
