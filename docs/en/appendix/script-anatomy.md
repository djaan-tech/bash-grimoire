<!-- Anatomy of a Bash script -->
<a name="anatomy-of-a-bash-script"></a>

```text
╔════════════════════════════════════════════════════════════════════════════════════════════════════╗
║  █████  ███    ██  █████  ████████  ██████  ███    ███ ██    ██      ██████  ███████      █████    ║
║ ██ ░░██░████░  ██░██ ░░██░  ░██░░░░██ ░░░██░████░ ████░░██░ ██ ░░   ██ ░░░██░██░░░░░░░   ██ ░░██░  ║
║ ███████░██░██░ ██░███████░░  ██░░  ██░░  ██░██░████ ██░░ ████ ░░    ██░░  ██░█████       ███████░░ ║
║ ██░░░██░██░░██░██░██░░░██░░  ██░░  ██░░  ██░██░░██░░██░░  ██░░░     ██░░  ██░██░░░░░     ██░░░██░░ ║
║ ██░░ ██░██░░ ████░██░░ ██░░  ██░░   ██████ ░██░░  ░░██░░  ██░░       ██████ ░██░░        ██░░ ██░░ ║
║   ░░   ░░ ░░   ░░░░ ░░   ░░    ░░     ░░░░░░  ░░      ░░    ░░         ░░░░░░  ░░          ░░   ░░ ║
║                                                                                                    ║
║ ██████   █████  ███████ ██   ██     ███████  ██████ ██████  ██ ██████  ████████                    ║
║ ██░░░██░██ ░░██░██░░░░░░██░░ ██░░   ██░░░░░░██ ░░░░░██░░░██░██░██░░░██░  ░██░░░░░                  ║
║ ██████ ░███████░███████ ███████░░   ███████ ██░░    ██████ ░██░██████ ░░  ██░░                     ║
║ ██░░░██░██░░░██░░ ░░░██░██░░░██░░     ░░░██░██░░    ██░░░██░██░██░░░░░░   ██░░                     ║
║ ██████ ░██░░ ██░███████░██░░ ██░░   ███████░░██████ ██░░ ██░██░██░░       ██░░                     ║
║   ░░░░░░  ░░   ░░ ░░░░░░░ ░░   ░░     ░░░░░░░  ░░░░░░ ░░   ░░ ░░ ░░         ░░                     ║
╚════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

[**English**](script-anatomy.md) | [Español](../../es/apendice/anatomia-de-un-script.md)

[Appendix](README.md) · [Cheat sheet](../../../CHEATSHEET.md)

## Essential parts

| Part | What it means in practice |
| --- | --- |
| Shebang (`#!`) | Selects the interpreter when the file is run directly. `#!/usr/bin/env bash` makes `env` look for Bash in `PATH`. |
| Comment | An unquoted `#` at the start of a word makes the rest of the line a comment. |
| Argument | A value passed to a command or function. In `bash describe.sh 'daily report.txt'`, the script receives `daily report.txt` as one argument. |
| Option | An argument that changes a command’s behaviour. In `bash -n describe.sh`, `-n` tells Bash to check the syntax. |
| Parameter | An element that holds a value and is identified by name, position or symbol. `$1` expands the first positional parameter and `$#` gives the argument count. |
| Variable | A named parameter in which you can store a value. `local name="$1"` stores it in a local variable and `"$name"` reads it as one argument. |
| Function | A named block you can call like a command. It gets its own positional parameters for the duration of the call. |
| Conditional and loop | `if` decides what to run based on an exit status. `for` and `while` repeat operations. |
| Redirection and pipeline | `>&2` sends a command’s standard output to its standard error. A pipeline connects one command’s standard output to another command’s standard input. |
| Exit status | A numeric result. By convention, `0` means success. `return` ends a function and `exit` ends the shell running the script. |

## An example from start to finish

Save the block in a new file called `describe.sh`. The script checks how many arguments it receives and prints the name it was given.

```bash
#!/usr/bin/env bash

describe() {
  local name="$1"
  printf 'File: %s\n' "$name"
}

if (( $# != 1 )); then
  printf 'Usage: %s FILE\n' "$0" >&2
  exit 2
fi

describe "$1"
```

```bash
bash describe.sh 'daily report.txt'
```

1. Quoting makes the calling shell pass the name with spaces as one argument. Bash assigns it to the parameter expanded by `$1`.
2. `describe "$1"` reads that value and passes it to the function, where it is available as the function’s own `$1`.
3. If `printf` successfully prints `File: daily report.txt`, the function and script finish with status `0`. If the argument count is wrong, the script writes a usage message to standard error and returns `2`. In that message, `$0` gives the name used to invoke the script.

[Parameters and arguments](../02-syntax/arguments.md) · [Functions](../02-syntax/functions.md) · [Input, output and exit status](../01-fundamentals/io-and-exit-status.md)
