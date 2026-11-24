# Input, output and exit status

[**English**](io-and-exit-status.md) | [Español](../../es/01-fundamentos/entrada-salida-y-codigos.md)

[Section index](README.md)

## Standard streams

**What they are:** The three standard streams carry input, results and diagnostics.

**Syntax**
```bash
command < input.txt > output.txt 2> errors.txt
```

**Example**
```bash
printf '%s\n' 'result'
printf '%s\n' 'diagnostic' >&2
```

**How it works:** The streams use file descriptors 0, 1 and 2, respectively. `>&2` sends the command’s standard output to the same destination as its standard error.

**When to use it:** Send data to another program while keeping diagnostics separate.

**Important:** A command can write to standard error and still exit successfully.

## Reading with read

**What it is:** The Bash builtin `read` reads a line from standard input and assigns it to variables.

**Syntax**
```bash
IFS= read -r variable < input.txt
```

**Example**
```bash
IFS= read -r line <<< '  report\2026  '
printf '<%s>\n' "$line"
```

**How it works:** An empty `IFS` preserves leading and trailing whitespace. `-r` keeps backslashes literal. The Bash here-string operator `<<<` supplies the quoted string followed by a newline.

**When to use it:** Read user input or records without changing their spacing.

**Important:** If the last record has no final newline, `read` can assign its text and still return a nonzero status. See [line-by-line reading](../04-patterns/reading-files.md).

## Redirections

**What it is:** A redirection changes where a command reads or writes.

**Syntax**
```bash
command < input.txt > output.txt 2> errors.txt
command >> output.txt
command > combined.txt 2>&1
```

**Example**
```bash
(
  output=$(mktemp) || exit 1
  trap 'rm -f -- "$output"' EXIT
  printf '%s\n' 'first record' > "$output" || exit 1
  printf '%s\n' 'next record' >> "$output" || exit 1
  cat -- "$output"
)
```

**How it works:** Bash applies redirections from left to right before running the command. `>` creates or truncates a file. `>>` creates or appends. The example prints both records.

**When to use it:** Save a report, append to a log or read a file through standard input.

**Important:** `2>&1` copies the current destination of standard output to standard error. After `> combined.txt`, both streams go to that file. Before it, standard error keeps the original destination.

## Pipelines

**What it is:** A pipeline connects the standard output of one command to the standard input of the next.

**Syntax**
```bash
producer | consumer
```

**Example**
```bash
printf '%s\n' alpha beta | wc -l
```

**How it works:** Bash opens a pipe and the commands can run concurrently. `wc -l` counts newline characters. Standard error remains separate. Bash also supports `|&` to pipe both output streams.

**When to use it:** Filter, sort or summarise a stream of data without an intermediate file.

**Important:** The status comes from the last command by default. See [`pipefail`](../04-patterns/handling-errors.md#pipefail) to detect earlier failures. Bash normally runs each stage in a separate subshell. The final stage may run in the current shell with `lastpipe` and job control disabled.

## Exit status

**What it is:** An exit status is a numeric result.
By convention, zero indicates success.

**Syntax**
```bash
command
status=$?
```

**Example**
```bash
bash -c 'printf "%s\n" ready; exit 3'
status=$?
printf 'status=%s\n' "$status"
```

**How it works:** The child Bash prints `ready` and returns 3. The caller exposes the status of the most recently completed foreground pipeline through `$?`.

**When to use it:** Branch on success, propagate an error or distinguish a documented condition such as an empty search result.

**Important:** Save `$?` before running another command. See the [cheat sheet](../../../CHEATSHEET.md#exit-statuses) for Bash’s standard codes.

## Conditional execution

**What it is:** `&&` runs the next command on success.
`||` runs it on a nonzero status.

**Syntax**
```bash
first && next
first || fallback
```

**Example**
```bash
[[ -d . ]] && printf '%s\n' 'directory exists'
[[ -f ./missing-input.txt ]] || printf '%s\n' 'missing input' >&2
```

**How it works:** Bash skips the right-hand command when its condition is not met. Both operators use exit statuses and can connect any commands.

**When to use it:** Guard a short action or report a failed check.

**Important:** Bash evaluates `&&` and `||` left to right. In `check && action || fallback`, `fallback` also runs if `action` fails. Use `if` for exclusive branches.

[Redirections](https://www.gnu.org/software/bash/manual/html_node/Redirections.html) · [Pipelines](https://www.gnu.org/software/bash/manual/html_node/Pipelines.html) · [Exit status](https://www.gnu.org/software/bash/manual/html_node/Exit-Status.html)
