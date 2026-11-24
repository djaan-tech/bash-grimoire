<!-- Processes and subshells -->
<a name="processes-and-subshells"></a>

```text
╔═══════════════════════════════════════════════════════════════════════════════════════════════╗
║ ██████ ██████  ██████  █████████████████████████████████████████     █████ ███    ████████    ║
║ ██░░░████░░░████ ░░░████ ░░░░██░░░░░██░░░░░██░░░░░██░░░░░██░░░░░░░  ██ ░░██████░  ████░░░██░  ║
║ ██████ ██████ ██░░  ████░░   █████  ███████████████████  ███████    █████████░██░ ████░░ ██░░ ║
║ ██░░░░░██░░░████░░  ████░░   ██░░░░░  ░░░██░░░░░████░░░░░  ░░░██░░  ██░░░████░░██░████░░ ██░░ ║
║ ██░░   ██░░ ██░██████ ░█████████████████████████████████████████░░  ██░░ ████░░ ██████████ ░░ ║
║   ░░     ░░   ░░ ░░░░░░  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░    ░░   ░░░░   ░░░░░░░░░░  ║
║                                                                                               ║
║ █████████    ████████ █████████   ███████████     ██     ███████                              ║
║ ██░░░░░██░░  ████░░░████░░░░░██░░ ████░░░░░██░░   ██░░   ██░░░░░░░                            ║
║ █████████░░  ████████ ███████████████████  ██░░   ██░░   ███████                              ║
║   ░░░████░░  ████░░░██░ ░░░████░░░████░░░░░██░░   ██░░     ░░░██░░                            ║
║ ███████░██████ ██████ █████████░░ ██████████████████████████████░░                            ║
║   ░░░░░░░ ░░░░░░ ░░░░░░ ░░░░░░░░░   ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░                            ║
╚═══════════════════════════════════════════════════════════════════════════════════════════════╝
```

[**English**](processes-and-subshells.md) | [Español](../../es/01-fundamentos/procesos-y-subshells.md)

[Section index](README.md)

## Process and PID

**What it is:** A process is a running program with its own process ID, or PID.

**Syntax**
```bash
command &
pid=$!
wait "$pid"
```

**Example**
```bash
sleep 1 &
pid=$!
printf 'PID=%s\n' "$pid"
wait "$pid"
```

**How it works:** `&` starts the command asynchronously. `$!` identifies the last background job’s process. For this single command, `wait` returns its status.

**When to use it:** Start independent work in the background and wait before using its result.

**Important:** Save `$!` before starting another background job. `$$` keeps the original shell’s PID inside a subshell. `$BASHPID` gives the current Bash process’s PID.

## Subshell

**What it is:** A subshell is a copy of the shell’s execution environment.

**Syntax**
```bash
( command; another_command )
```

**Example**
```bash
mode=outside
( mode=inside; printf '%s\n' "$mode" )
printf '%s\n' "$mode"
```

**How it works:** Bash isolates shell state for the group. Its variables and directory changes stay inside the subshell. Output uses the inherited descriptors unless redirected.

**When to use it:** Change directory or shell options temporarily while running a group of commands.

**Important:** Changes to files still affect the file system. `(command)` groups commands, while `$(command)` substitutes their standard output into a word.

[Command execution environment](https://www.gnu.org/software/bash/manual/html_node/Command-Execution-Environment.html)
