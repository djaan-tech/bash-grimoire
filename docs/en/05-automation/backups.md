# Directory backups

[**English**](backups.md) | [Español](../../es/05-automatizacion/copias-de-seguridad.md)

[Section index](README.md)

## Problem

Create a dated, compressed archive of a directory and leave any existing backups intact.

## Requirements

Bash, GNU [`tar`](../03-commands/system/tar.md), gzip, GNU Coreutils (`realpath`, `mkdir`, `date`, `mktemp`, `ln`, `rm`) and a destination on a file system that supports hard links.

## Complete script

[Source file](../../../examples/backup.sh)

<details>
<summary>Show script</summary>

```bash
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
```

</details>

## How it works

`realpath` resolves symbolic links before the script checks that the destination is outside the source. With `-z`, paths end in NUL, so Bash’s `read -d ''` can read names containing newlines.

`tar -czf` creates a gzip archive in a temporary file. `-C` makes the stored paths relative to the source’s parent. Clearing `TAR_OPTIONS` for this command prevents inherited options from altering the operation.

After `tar` succeeds, `ln -T` gives the same file a second, dated name and fails if that name already exists. The exit trap removes the temporary name.

## Run it

From the repository root, prepare a temporary source and back it up.

```bash
(
  work=$(mktemp -d) || exit 1
  mkdir -- "$work/project files" || exit 1
  printf '%s\n' 'weekly notes' > "$work/project files/notes.txt"
  bash examples/backup.sh "$work/project files" "$work/backups"
)
```

## Example result

```text
Backup created: /tmp/tmp.X7qV0Lr1fd/backups/backup-20261123T073000Z.tar.gz
```

## Errors and limitations

`0` means the archive was created. `2` covers invalid paths, failed compression or an existing filename. Two runs to the same destination in the same UTC second can generate the same name. Use trusted paths.

Files may change during the copy. Backup rotation and consistent snapshots require additional tools. Before relying on a backup, list it with `tar -tzf` and test a restore in an empty directory.
