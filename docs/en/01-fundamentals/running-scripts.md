<!-- Running scripts -->
<a name="running-scripts"></a>

```text
╔══════════════════════════════════════════════════════════════╗
║ ██████  ██    ██ ███    ██ ███    ██ ██ ███    ██  ██████    ║
║ ██░░░██░██░░  ██░████░  ██░████░  ██░██░████░  ██░██ ░░░░░░  ║
║ ██████ ░██░░  ██░██░██░ ██░██░██░ ██░██░██░██░ ██░██░░ ███   ║
║ ██░░░██░██░░  ██░██░░██░██░██░░██░██░██░██░░██░██░██░░  ██░░ ║
║ ██░░ ██░░██████ ░██░░ ████░██░░ ████░██░██░░ ████░░██████ ░░ ║
║   ░░   ░░  ░░░░░░  ░░   ░░░░ ░░   ░░░░ ░░ ░░   ░░░░  ░░░░░░  ║
║                                                              ║
║ ███████  ██████ ██████  ██ ██████  ████████ ███████          ║
║ ██░░░░░░██ ░░░░░██░░░██░██░██░░░██░  ░██░░░░██░░░░░░░        ║
║ ███████ ██░░    ██████ ░██░██████ ░░  ██░░  ███████          ║
║   ░░░██░██░░    ██░░░██░██░██░░░░░░   ██░░    ░░░██░░        ║
║ ███████░░██████ ██░░ ██░██░██░░       ██░░  ███████░░        ║
║   ░░░░░░░  ░░░░░░ ░░   ░░ ░░ ░░         ░░    ░░░░░░░        ║
╚══════════════════════════════════════════════════════════════╝
```

[**English**](running-scripts.md) | [Español](../../es/01-fundamentos/ejecucion-de-scripts.md)

[Section index](README.md)

## Run a script

**What it is:** A script is a file of shell commands.
You can pass it to Bash or run it as an executable.

**Syntax**
```bash
bash script.sh [argument ...]
./script.sh [argument ...]
```

**Example**
```bash
bash examples/check-disk.sh / 100
```

**How it works:** `bash script.sh` makes Bash read the file. For `./script.sh`, Linux reads the first line when executing the file. The shebang `#!/usr/bin/env bash` runs `env`, which finds Bash through `PATH`.

**When to use it:** Use `bash` to run a readable file. For direct execution, put the Bash shebang on line one and run `chmod u+x script.sh`.

**Important:** Run the example from the repository root. Shell files use Unix line endings (LF).

## Load a file into the current shell

**What it is:** `source` reads and executes shell code in the current shell.

**Syntax**
```bash
source file [argument ...]
. ./file
```

**Example**
```bash
(
  settings=$(mktemp) || exit 1
  trap 'rm -f -- "$settings"' EXIT
  printf '%s\n' 'mode=report' > "$settings" || exit 1
  source "$settings" || exit 1
  printf '%s\n' "$mode"
)
```

**How it works:** A sourced file can change variables, functions, shell options and the working directory. The example confines those changes to `( ... )` and removes the temporary file when that subshell exits.

**When to use it:** Load functions or a trusted configuration written as shell code.

**Important:** Source trusted files only. An explicit path such as `./settings.sh` avoids a search through `PATH`. The dot form is POSIX syntax.

[Shell scripts](https://www.gnu.org/software/bash/manual/html_node/Shell-Scripts.html)
