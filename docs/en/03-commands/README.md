# Command dictionary

[**English**](README.md) | [Español](../../es/03-comandos/README.md)

[Handbook home](../../../README.md)

[By name](#alphabetical-index) · [By task](#by-category) · [Practice files](#practice-files)

Bash prepares arguments and redirections. The program then interprets its options and processes its input. In this dictionary, `kill` usually runs as a Bash builtin.

## Alphabetical index

[`awk`](text/awk.md) · [`chmod`](system/chmod.md) · [`cp`](files/cp.md) · [`cut`](text/cut.md) · [`date`](system/date.md) · [`df`](system/df.md) · [`du`](system/du.md) · [`find`](files/find.md) · [`grep`](text/grep.md) · [`kill`](processes/kill.md) · [`ls`](files/ls.md) · [`mv`](files/mv.md) · [`pgrep`](processes/pgrep.md) · [`ps`](processes/ps.md) · [`rm`](files/rm.md) · [`sed`](text/sed.md) · [`sort`](text/sort.md) · [`systemctl`](system/systemctl.md) · [`tar`](system/tar.md) · [`wc`](text/wc.md)

## By category

### Files and directories

[`cp`](files/cp.md) copy · [`find`](files/find.md) search · [`ls`](files/ls.md) list · [`mv`](files/mv.md) move · [`rm`](files/rm.md) remove

### Text processing

[`awk`](text/awk.md) process records · [`cut`](text/cut.md) select columns · [`grep`](text/grep.md) filter lines · [`sed`](text/sed.md) replace text · [`sort`](text/sort.md) order · [`wc`](text/wc.md) count

### Processes

[`kill`](processes/kill.md) send signals · [`pgrep`](processes/pgrep.md) find PIDs · [`ps`](processes/ps.md) inspect processes

### System administration

[`chmod`](system/chmod.md) set permissions · [`date`](system/date.md) format time · [`df`](system/df.md) check free space · [`du`](system/du.md) measure files · [`systemctl`](system/systemctl.md) inspect services · [`tar`](system/tar.md) archive files

## Practice files

Run this block in a separate Bash terminal. It enters a new temporary directory, away from your files.

```bash
work=$(mktemp -d) || exit
cd "$work" || exit
mkdir -- "sample data"
printf '%s\n%s' '  first\record  ' 'last record' > 'sample data/notes file.txt'
printf '%s\n' 'quarterly report' > report.txt
printf '%s\n' 'ready to rename' > old.txt
printf '%s\n' '#!/usr/bin/env bash' 'printf "%s\n" ready' > job.sh
printf '%s\n' 'INFO started' 'ERROR timeout' 'ERROR retry' > app.log
printf '%s\n' 'root:95' 'data:41' > usage.txt
```
