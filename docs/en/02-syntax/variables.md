# Variables

[**English**](variables.md) | [Español](../../es/02-sintaxis/variables.md)

[Section index](README.md)

## Assignment

**What it is:** A variable stores a value under a name in the shell.

**Syntax**
```bash
name=value
name="value with spaces"
```

**Example**
```bash
report="weekly report.txt"
printf '%s\n' "$report"
```

**How it works:** Bash recognises `name=value` as an assignment. In a simple standalone assignment, Bash expands the value without word splitting or filename expansion.

**When to use it:** Store a path, a setting or an intermediate result.

**Important:** Keep spaces away from `=`. Quote a literal value that contains spaces. Variable names are case-sensitive.

## Shell, local and environment variables

**What it is:** A shell variable belongs to the current shell.
An exported variable is passed in the environment of new child processes.

**Syntax**
```bash
export name=value
name=value command
local name=value  # Inside a Bash function
```

**Example**
```bash
mode=brief
export mode
bash -c 'printf "%s\n" "$mode"'
```

**How it works:** `export` marks `mode` for inheritance. `name=value command` supplies a value for an external command’s environment for that invocation. Inside a function, `local` gives a variable function scope, visible to functions called from it.

**When to use it:** Use environment variables for settings a child program reads. Use `local` for temporary variables inside functions.

**Important:** A child cannot export changes back to its parent. A variable can be both local and exported.

[Shell parameters](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html) · [Environment](https://www.gnu.org/software/bash/manual/html_node/Environment.html)
