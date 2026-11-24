#!/usr/bin/env bash

if (( $# != 1 )); then
  printf 'Usage: %s LOG_FILE\n' "$0" >&2
  exit 2
fi

log=$1
if [[ ! -f $log || ! -r $log ]]; then
  printf 'Cannot read a regular log file at %s.\n' "$log" >&2
  exit 2
fi

# Count matching lines once, even if ERROR appears twice on the same line.
if count=$(LC_ALL=C grep -aFc -e 'ERROR' < "$log"); then
  :
else
  status=$?
  # A redirection error can also return 1, but leaves the count empty.
  if (( status != 1 )) || [[ $count != 0 ]]; then
    printf 'Could not analyse %s (search status %d).\n' "$log" "$status" >&2
    exit 2
  fi
fi

printf '%s: %s line(s) containing ERROR\n' "$log" "$count"
