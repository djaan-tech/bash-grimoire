<!-- ls — List directory contents -->
<a name="ls--list-directory-contents"></a>

```text
██╗     ███████╗
██║     ██╔════╝
██║     ███████╗
██║     ╚════██║
███████╗███████║
╚══════╝╚══════╝
```

*List directory contents*

[**English**](ls.md) | [Español](../../../es/03-comandos/archivos/ls.md)

[Command dictionary](../README.md)

**What does it do?**

Lists directory entries or displays information about the supplied paths.

**Basic syntax**
```bash
ls [options] [path ...]
```

**Practical example**
```bash
ls -lah -- .
```

`-l` selects the long format, `-a` includes dot-prefixed entries and `-h` displays human-readable sizes. `--` ends option parsing.

**What happens internally?**

`ls` reads the directory entries. With `-l`, it also gets file metadata such as permissions and size. The output layout can change when standard output is a terminal.

**When should I use it?**

Inspect a directory or check permissions and sizes interactively.

**What should I remember?**

Use a glob or `find` when a script needs exact filenames. Display formatting and filenames with newlines make ordinary `ls` output unsuitable as a list of paths. `-h` is outside POSIX.

[Upstream reference](https://www.gnu.org/software/coreutils/manual/html_node/ls-invocation.html)
