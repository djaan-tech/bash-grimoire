#!/usr/bin/env bash

if (( $# > 2 )); then
  printf 'Usage: %s [path] [threshold]\n' "$0" >&2
  exit 2
fi

path=${1-/}
threshold=${2-80}

# Check the decimal text before feeding it into Bash arithmetic.
if [[ ! $threshold =~ ^[0123456789]{1,3}$ ]] || (( 10#$threshold > 100 )); then
  printf 'Threshold must be an integer from 0 to 100.\n' >&2
  exit 2
fi
threshold=$(( 10#$threshold ))

if ! output=$(LC_ALL=C df --output=pcent -- "$path"); then
  printf 'Cannot determine disk usage for %s.\n' "$path" >&2
  exit 2
fi

# GNU df returns a heading followed by the percentage for this path.
row=${output#*$'\n'}
if [[ $output != *$'\n'* || ! $row =~ ^[[:blank:]]*([0123456789]{1,9})%$ ]]; then
  printf 'Unexpected disk usage for %s.\n' "$path" >&2
  exit 2
fi
usage=$(( 10#${BASH_REMATCH[1]} ))

if (( usage >= threshold )); then
  printf 'WARNING: %s is %d%% full (threshold %d%%).\n' "$path" "$usage" "$threshold" >&2
  exit 1
fi

printf 'OK: %s is %d%% full (threshold %d%%).\n' "$path" "$usage" "$threshold"
