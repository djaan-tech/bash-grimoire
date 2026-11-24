<!-- pgrep — Find process IDs by name -->
<a name="pgrep--find-process-ids-by-name"></a>

```text
╔════════════════════════════════════════════╗
║ ██████   ██████  ██████  ███████ ██████    ║
║ ██░░░██░██ ░░░░░░██░░░██░██░░░░░░██░░░██░  ║
║ ██████ ░██░░ ███ ██████ ░█████   ██████ ░░ ║
║ ██░░░░░░██░░  ██░██░░░██░██░░░░░ ██░░░░░░  ║
║ ██░░     ██████ ░██░░ ██░███████ ██░░      ║
║   ░░       ░░░░░░  ░░   ░░ ░░░░░░░ ░░      ║
╚════════════════════════════════════════════╝
```

*Find process IDs by name*

[**English**](pgrep.md) | [Español](../../../es/03-comandos/procesos/pgrep.md)

[Command dictionary](../README.md)

**What does it do?**

Lists process IDs whose names or command lines match a regular expression.

**Basic syntax**
```bash
pgrep [options] 'pattern'
```

**Practical example**
```bash
pgrep -x -l bash
```

`-x` requires the whole process name to match. `-l` includes the name beside each PID. Run it from a Bash terminal to look for running Bash processes.

**What happens internally?**

On Linux, procps-ng reads process data from `/proc`, applies an extended regular expression and prints one match per line.

**When should I use it?**

Check whether a named process is running or find candidate PIDs to inspect.

**What should I remember?**

With procps-ng, status 1 means no match. The name used by default is limited to 15 bytes on Linux. `-f` matches the full command line and can broaden matches substantially.

[Upstream reference](https://man7.org/linux/man-pages/man1/pgrep.1.html)
