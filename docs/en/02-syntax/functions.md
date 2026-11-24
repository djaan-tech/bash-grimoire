# Functions

[**English**](functions.md) | [Español](../../es/02-sintaxis/funciones.md)

[Section index](README.md)

## Define and call functions

**What it is:** A function groups commands under a name within the shell.

**Syntax**
```bash
name() {
  command
}
name argument
```

**Example**
```bash
report_path() {
  local path=$1
  printf 'Path: %s\n' "$path"
}
report_path 'annual report.txt'
```

**How it works:** On a direct call, Bash runs the function in the current shell and replaces its positional parameters for the duration of the call. `local` gives `path` function scope.

**When to use it:** Reuse a short task, centralise a diagnostic or separate a script’s main flow from the details.

**Important:** Validate the argument count before reading `$1` in a public function. Use `name() { ...; }` for the POSIX-compatible form of the declaration.

## Return a status and produce output

**What it is:** A function reports its status through `return` or its last command.
It can write data to standard output.

**Syntax**
```bash
return status
value=$(function_name argument)
```

**Example**
```bash
report_label() {
  [[ $# -eq 1 ]] || return 2
  printf 'report-%s\n' "$1"
}
if label=$(report_label weekly); then
  printf '%s\n' "$label"
fi
```

**How it works:** A direct call leaves the function’s status in `$?`. With `$(...)`, Bash captures standard output in a subshell. An assignment without a command takes the status of its last command substitution.

**When to use it:** Return success or failure to the caller while optionally producing data it can capture.

**Important:** Send diagnostics to standard error so captured data stays clean. State changes in a subshell do not reach the calling shell.

[Shell functions](https://www.gnu.org/software/bash/manual/html_node/Shell-Functions.html)
