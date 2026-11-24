<!-- rm — Remove directory entries -->
<a name="rm--remove-directory-entries"></a>

```text
╔══════════════════════╗
║ ██████  ███    ███   ║
║ ██░░░██░████░ ████░░ ║
║ ██████ ░██░████ ██░░ ║
║ ██░░░██░██░░██░░██░░ ║
║ ██░░ ██░██░░  ░░██░░ ║
║   ░░   ░░ ░░      ░░ ║
╚══════════════════════╝
```

*Remove directory entries*

[**English**](rm.md) | [Español](../../../es/03-comandos/archivos/rm.md)

[Command dictionary](../README.md)

**What does it do?**

Deletes files or, with `-r`, directory trees.

**Basic syntax**
```bash
rm [options] file ...
```

**Practical example**
```bash
temp_file=$(mktemp) && rm -i -- "$temp_file"
```

`-i` prompts before each removal. `--` ends option parsing. `mktemp` creates the test file and `&&` runs `rm` only when creation succeeds.

**What happens internally?**

Bash expands unquoted wildcards before `rm` runs. `rm` asks the operating system to unlink each named entry. Removing one hard link leaves any other names for the same file intact.

**When should I use it?**

Remove a known temporary file after its contents have been used.

**What should I remember?**

Deletion does not send files to the trash. `-r` traverses directories and `-f` suppresses prompts and ignores missing files. Inspect expanded paths before using recursion.

[Upstream reference](https://www.gnu.org/software/coreutils/manual/html_node/rm-invocation.html)
