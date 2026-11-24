<!-- Bash cheat sheet -->
<a name="bash-cheat-sheet"></a>

```text
 ██████╗██╗  ██╗███████╗ █████╗ ████████╗    ███████╗██╗  ██╗███████╗███████╗████████╗
██╔════╝██║  ██║██╔════╝██╔══██╗╚══██╔══╝    ██╔════╝██║  ██║██╔════╝██╔════╝╚══██╔══╝
██║     ███████║█████╗  ███████║   ██║       ███████╗███████║█████╗  █████╗     ██║
██║     ██╔══██║██╔══╝  ██╔══██║   ██║       ╚════██║██╔══██║██╔══╝  ██╔══╝     ██║
╚██████╗██║  ██║███████╗██║  ██║   ██║       ███████║██║  ██║███████╗███████╗   ██║
 ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝       ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝   ╚═╝
```

*Bash cheat sheet*

[**English**](CHEATSHEET.md) | [Español](CHEATSHEET.es.md)

[Handbook home](README.md)

[Variables](#variables-and-expansions) · [Tests](#tests-and-conditionals) · [Arguments](#arguments-and-arrays) · [Redirections](#redirections) · [Exit status](#exit-statuses) · [Commands](#common-commands)

## Variables and expansions

| Syntax | Use |
| --- | --- |
| `name=value` | Assign a shell variable. |
| `"$name"` | Expand a value as one argument. |
| `"${name:-default}"` | Use a default for an unset or empty value. |
| `export name` | Pass the variable to child processes. |
| `value=$(command)` | Capture standard output. |
| `"$(( count + 1 ))"` | Expand an integer result. |

## Tests and conditionals

| Syntax | Use |
| --- | --- |
| `if condition; then action; fi` | Run the action on status zero. |
| `elif condition; then action` | Try a further condition before `else` or `fi`. |
| `else fallback` | Handle the remaining case before `fi`. |
| `[[ $a == "$b" ]]` | Compare strings literally. |
| `[[ $a =~ $regex ]]` | Test a regular expression. |
| `[[ $n -eq 3 ]]` | Test integer equality. |
| `case $mode in start) run ;; esac` | Dispatch on a shell pattern. |

## Loops and functions

| Syntax | Use |
| --- | --- |
| `for item in "$@"; do work "$item"; done` | Process each argument separately. |
| `while condition; do work; done` | Repeat while the condition succeeds. |
| `until condition; do work; done` | Repeat until the condition succeeds. |
| `name() { work; }` | Define a function. |
| `local name=value` | Define a variable local to a function call. |
| `return 2` | Return a status from a function. |

## Arguments and arrays

| Syntax | Use |
| --- | --- |
| `$0 / $1 / ${10}` | Read the invocation name, first or tenth argument. |
| `$#` | Count positional arguments. |
| `"$@"` | Keep each argument as a separate word. |
| `"$*"` | Join arguments into one word using `IFS`. |
| `shift` | Drop the first positional argument. |
| `items=(a "b c")` | Create an indexed array. |
| `"${items[@]}"` | Expand one word per array element. |

## File tests

| Syntax | Use |
| --- | --- |
| `[[ -e $path ]]` | Check whether a path exists. |
| `[[ -f $path ]]` | Check for a regular file. |
| `[[ -d $path ]]` | Check for a directory. |
| `[[ -r $path ]]` | Check for read permission. |
| `[[ -L $path ]]` | Check for a symbolic link. |

## Operators and pipelines

```bash
first && next        # Run next if first exits with zero.
first || fallback    # Run fallback if first exits nonzero.
! command           # Invert success or failure.
producer | consumer # Connect standard output to standard input.
```

## Redirections

| Syntax | Use |
| --- | --- |
| `command < "$file"` | Read the file through standard input. |
| `command > "$file"` | Write standard output, truncating the file. |
| `command >> "$file"` | Append standard output. |
| `command 2> "$errors"` | Redirect standard error. |
| `command > "$log" 2>&1` | Send both output streams to the file. |

## Exit statuses

| Syntax | Use |
| --- | --- |
| `$?` | Status of the last foreground pipeline. |
| `exit 0` | End the script successfully. |
| `exit 2` | End the script with status 2, often used for a usage error. |
| `126 / 127` | Bash found an unexecutable command or found no command, respectively. |
| `128 + N` | Status Bash reports for a command terminated by signal N. |
| `set -o pipefail` | Use the rightmost failing stage’s status, or zero if all succeed. |

## Common commands

| Syntax | Use |
| --- | --- |
| `ls -lah -- .` | Inspect the current directory. |
| `cp -i -- source target` | Copy and prompt before overwriting. |
| `mv -i -- source target` | Move or rename with an overwrite prompt. |
| `find . -type f -name '*.log'` | Find regular files with a log suffix. |
| `grep -nF -e 'ERROR' app.log` | Show matching lines and line numbers. |
| `awk -F ':' '{print $1}' file` | Print the first colon-delimited field. |
| `sed 's/old/new/g' file` | Print text with all matches replaced. |
| `cut -d ':' -f 1 file` | Select the first delimited field. |
| `sort -n file` | Sort by a numeric value at the start of each line. |
| `wc -l file` | Count newline characters. |
| `ps -p "$$" -o pid,comm` | Show the current shell’s PID and command name on Linux. |
| `df -h -- .` | Show usage of the current file system. |
| `du -sh -- .` | Summarise disk usage of the current directory tree. |
| `tar -tzf backup.tar.gz` | List an archive compressed with gzip. |
| `date -u +%Y-%m-%d` | Print today’s date in UTC. |

[Full command dictionary](docs/en/03-commands/README.md) · [Handling errors](docs/en/04-patterns/handling-errors.md) · [Anatomy of a script](docs/en/appendix/script-anatomy.md)
