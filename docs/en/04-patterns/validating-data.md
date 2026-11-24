<!-- Validating data -->
<a name="validating-data"></a>

```text
╔══════════════════════════════════════════════════════════════════════════════╗
║ ██    ██  █████  ██      ██ ██████   █████  ████████ ██ ███    ██  ██████    ║
║ ██░░  ██░██ ░░██░██░░    ██░██░░░██░██ ░░██░  ░██░░░░██░████░  ██░██ ░░░░░░  ║
║ ██░░  ██░███████░██░░    ██░██░░ ██░███████░░  ██░░  ██░██░██░ ██░██░░ ███   ║
║  ██░ ██ ░██░░░██░██░░    ██░██░░ ██░██░░░██░░  ██░░  ██░██░░██░██░██░░  ██░░ ║
║   ████ ░░██░░ ██░███████ ██░██████ ░██░░ ██░░  ██░░  ██░██░░ ████░░██████ ░░ ║
║     ░░░░   ░░   ░░ ░░░░░░░ ░░ ░░░░░░  ░░   ░░    ░░    ░░ ░░   ░░░░  ░░░░░░  ║
║                                                                              ║
║ ██████   █████  ████████  █████                                              ║
║ ██░░░██░██ ░░██░  ░██░░░░██ ░░██░                                            ║
║ ██░░ ██░███████░░  ██░░  ███████░░                                           ║
║ ██░░ ██░██░░░██░░  ██░░  ██░░░██░░                                           ║
║ ██████ ░██░░ ██░░  ██░░  ██░░ ██░░                                           ║
║   ░░░░░░  ░░   ░░    ░░    ░░   ░░                                           ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

[**English**](validating-data.md) | [Español](../../es/04-patrones/validacion-de-datos.md)

[Section index](README.md) · [Practice files](../03-commands/README.md#practice-files)

## Check for a regular file

**Problem:** Decide whether a path leads to a regular file.

**Solution**
```bash
path='report.txt'
if [[ -f $path ]]; then
  printf '%s\n' "$path"
fi
```

**Why it works:** `-f` tests the file type and follows symbolic links. Use `-L` to detect a symbolic link itself.

**When to use it:** Check an input before opening it. Still handle opening errors because the path can change after the test.

## Check for a directory

**Problem:** Decide whether a path leads to a directory.

**Solution**
```bash
directory='sample data'
if [[ -d $directory ]]; then
  printf '%s\n' "$directory"
fi
```

**Why it works:** `-d` succeeds for directories and for symbolic links that resolve to a directory.

**When to use it:** Validate a source directory before traversing or copying it.

## Create a directory if needed

**Problem:** Prepare an output directory, including missing parent directories.

**Solution**
```bash
directory='sample output'
if ! mkdir -p -- "$directory"; then
  printf '%s\n' 'Cannot create output directory.' >&2
  exit 1
fi
```

**Why it works:** `mkdir -p` creates missing components and succeeds if the directory already exists. `--` ends option parsing.

**When to use it:** Prepare output paths without a separate existence check that can become stale.

## Validate a numeric argument

**Problem:** Accept one to three decimal digits and a value from 0 to 100.

**Solution**
```bash
value=${1-}
if [[ ! $value =~ ^[0123456789]{1,3}$ ]] || (( 10#$value > 100 )); then
  printf '%s\n' 'Expected a value from 0 to 100.' >&2
  exit 2
fi
```

**Why it works:** The regular expression checks one to three ASCII digits. `||` skips arithmetic when the format fails. `10#` makes the numeric base decimal.

**When to use it:** Validate thresholds and small limits before using them in calculations.

## Check command availability

**Problem:** Detect a missing dependency before starting a task.

**Solution**
```bash
if ! command -v tar >/dev/null 2>&1; then
  printf '%s\n' 'tar is required.' >&2
  exit 2
fi
```

**Why it works:** `command -v` returns whether the shell can resolve the name. Redirection discards its normal result and any diagnostic.

**When to use it:** Check optional tools or produce a clear dependency error. Availability alone says nothing about the tool’s options or version.
