# Disk usage monitoring

[**English**](monitoring.md) | [Español](../../es/05-automatizacion/monitorizacion.md)

[Section index](README.md)

## Problem

Warn when the file system containing a given path reaches a configured usage threshold.

## Requirements

Bash and GNU [`df`](../03-commands/system/df.md). The path defaults to `/` and the threshold to `80`.

## Complete script

[Source file](../../../examples/check-disk.sh)

<details>
<summary>Show script</summary>

```bash
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
```

</details>

## How it works

`df --output=pcent` produces a heading and a usage row. `LC_ALL=C` fixes the locale for that command. Bash captures the output and uses `BASH_REMATCH[1]` to get the digits before `%`. After validation, `10#` reads both numbers as decimal, even with leading zeroes.

## Run it

From the repository root, pass a path on the file system to inspect and a percentage without `%`.

```bash
bash examples/check-disk.sh / 80
```

## Example result

```text
OK: / is 62% full (threshold 80%).
```

## Errors and limitations

`0` means usage is below the threshold. `1` means usage is at or above the threshold. The warning goes to standard error. `2` means invalid input, a failed query or unexpected output. The script accepts usage figures from `df` with one to nine digits, including values above 100. A percentage describes a file system, including when you pass a directory.
