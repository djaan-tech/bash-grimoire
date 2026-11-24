<!-- Log analysis -->
<a name="log-analysis"></a>

```text
╔═══════════════════════════════════════════════════════════════════════════════════════════════╗
║ ██       ██████   ██████       █████  ███    ██  █████  ██      ██    ██ ███████ ██ ███████   ║
║ ██░░    ██ ░░░██░██ ░░░░░░    ██ ░░██░████░  ██░██ ░░██░██░░     ██░ ██ ░██░░░░░░██░██░░░░░░░ ║
║ ██░░    ██░░  ██░██░░ ███     ███████░██░██░ ██░███████░██░░      ████ ░░███████ ██░███████   ║
║ ██░░    ██░░  ██░██░░  ██░░   ██░░░██░██░░██░██░██░░░██░██░░       ██░░░   ░░░██░██░░ ░░░██░░ ║
║ ███████  ██████ ░░██████ ░░   ██░░ ██░██░░ ████░██░░ ██░███████    ██░░  ███████░██░███████░░ ║
║   ░░░░░░░  ░░░░░░   ░░░░░░      ░░   ░░ ░░   ░░░░ ░░   ░░ ░░░░░░░    ░░    ░░░░░░░ ░░ ░░░░░░░ ║
╚═══════════════════════════════════════════════════════════════════════════════════════════════╝
```

[**English**](log-analysis.md) | [Español](../../es/05-automatizacion/analisis-de-registros.md)

[Section index](README.md)

## Problem

Count log lines containing the literal text `ERROR` and print a short summary.

## Requirements

Bash, GNU [`grep`](../03-commands/text/grep.md) and a readable regular file.

## Complete script

[Source file](../../../examples/analyze-logs.sh)

<details>
<summary>Show script</summary>

```bash
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
```

</details>

## How it works

The script checks the file type and read permission. Bash opens the path as standard input. `grep` uses `-a` to treat input as text, `-F` for fixed text, `-c` to count matching lines and `-e` to supply the pattern. The script accepts status `1` with output `0` as an empty result. If Bash cannot open the file for redirection, the status can also be `1`, but there is no count.

## Run it

From the repository root, create a sample log in a temporary directory and pass its path to the script.

```bash
(
  work=$(mktemp -d) || exit 1
  printf '%s\n' 'INFO started' 'ERROR timeout' 'ERROR retry' > "$work/app log.txt"
  bash examples/analyze-logs.sh "$work/app log.txt"
)
```

## Example result

```text
/tmp/tmp.X7qV0Lr1fd/app log.txt: 2 line(s) containing ERROR
```

## Errors and limitations

`0` indicates a valid count, including zero. `2` means a usage or search error. Matching is case-sensitive and includes any line containing the substring, for example `SOME_ERROR`. A line with two occurrences counts once. The search reads the entire file and does not decompress rotated logs.
