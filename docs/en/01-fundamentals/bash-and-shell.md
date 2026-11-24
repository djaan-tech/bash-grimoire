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
command -v name
```

**Example**
```bash
type -t printf
command -v df
```

**How it works:** `type -t` reports a command’s kind. `command -v` reports how Bash would resolve a name. For a simple name after parsing and alias expansion, Bash normally checks functions, then builtins, then `PATH`.

**When to use it:** Check which implementation a script will invoke. Use `builtin printf` to select the Bash builtin explicitly.

**Important:** Commands such as `printf` and `kill` can have both implementations.

[Bash command search](https://www.gnu.org/software/bash/manual/html_node/Command-Search-and-Execution.html)
