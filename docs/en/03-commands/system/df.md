<!-- df — Report file-system usage -->
<a name="df--report-file-system-usage"></a>

```text
╔═══════════════════╗
║ ██████  ███████   ║
║ ██░░░██░██░░░░░░░ ║
║ ██░░ ██░█████     ║
║ ██░░ ██░██░░░░░   ║
║ ██████ ░██░░      ║
║   ░░░░░░  ░░      ║
╚═══════════════════╝
```

*Report file-system usage*

[**English**](df.md) | [Español](../../../es/03-comandos/sistema/df.md)

[Command dictionary](../README.md)

**What does it do?**

Reports used and available space for mounted file systems.

**Basic syntax**
```bash
df [options] [path ...]
```

**Practical example**
```bash
df -h -- .
```

`-h` shows human-readable sizes and `--` ends option parsing. `.` selects the file system containing the current directory.

**What happens internally?**

`df` asks the operating system for allocation statistics for the mounted file system that contains the path. There is no need to scan individual files.

**When should I use it?**

Check space on a mounted file system or monitor its usage percentage.

**What should I remember?**

`-h` is common but is outside POSIX. GNU `--output=pcent` selects the percentage column for scripts. [`du`](du.md) measures space attributed to paths.

[Upstream reference](https://www.gnu.org/software/coreutils/manual/html_node/df-invocation.html)
