# Bash and the shell

[**English**](bash-and-shell.md) | [Español](../../es/01-fundamentos/bash-y-shell.md)

[Section index](README.md)

## Shell and Bash

**What it is:** A shell reads commands and runs them.
Bash is a shell with its own scripting syntax.

**Syntax**
```bash
bash [options] [script [argument ...]]
```

**Example**
```bash
bash -c 'printf "%s\n" "Bash is running"'
```

**How it works:** With `-c`, Bash interprets the string as commands and runs its `printf` builtin. The calling shell passes the quoted string as one argument.

**When to use it:** Use Bash to automate tasks that combine system tools with tests, loops or functions.

**Important:** For POSIX `sh`, avoid Bash features such as `[[ ]]` and arrays. `sh script.sh` selects the system’s `sh`.

## Builtins and external programs

**What they are:** A builtin is implemented by Bash.
An external program is a separate executable.

**Syntax**
```bash
type -t name
type -a name
command -v name
```

**Example**
```bash
type -t printf
type -a printf
command -v df
```

**How it works:** `type -t printf` reports `builtin` in a shell where the name has not been redefined. `type -a printf` also lists executables with that name on `PATH`. After expanding aliases, Bash normally checks functions, then builtins, then `PATH`.

**When to use it:** Use `command -v` in a script to check whether Bash can resolve a name. It returns a nonzero status if the name is missing. Use `type -a` when investigating why a particular implementation runs.

**Important:** `help printf` documents the builtin and `builtin printf` selects it explicitly. Other names, such as `kill`, can also have both forms.

[Bash command search](https://www.gnu.org/software/bash/manual/html_node/Command-Search-and-Execution.html)
