<!-- ps — Inspect a snapshot of processes -->
<a name="ps--inspect-a-snapshot-of-processes"></a>

```text
██████╗ ███████╗
██╔══██╗██╔════╝
██████╔╝███████╗
██╔═══╝ ╚════██║
██║     ███████║
╚═╝     ╚══════╝
```

*Inspect a snapshot of processes*

[**English**](ps.md) | [Español](../../../es/03-comandos/procesos/ps.md)

[Command dictionary](../README.md)

**What does it do?**

Reports information about selected running processes.

**Basic syntax**
```bash
ps [options]
```

**Practical example**
```bash
ps -p "$$" -o pid,comm
```

`-p "$$"` selects the invoking shell’s PID. `-o pid,comm` prints the PID and command-name columns.

**What happens internally?**

Bash expands `$$` to the shell’s PID. On Linux, procps-ng reads process details from `/proc`, selects the requested PID and prints the requested columns once.

**When should I use it?**

Check a known PID or inspect selected process attributes.

**What should I remember?**

The process can exit immediately after the snapshot. Linux procps-ng accepts several option styles whose defaults and meanings can differ. The example uses its Unix-style options.

[Upstream reference](https://man7.org/linux/man-pages/man1/ps.1.html)
