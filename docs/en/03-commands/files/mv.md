# mv — Move or rename paths

[**English**](mv.md) | [Español](../../../es/03-comandos/archivos/mv.md)

[Command dictionary](../README.md) · [Practice files](../README.md#practice-files)

**What does it do?**

Moves a file or directory to another location, or changes its name.

**Basic syntax**
```bash
mv [options] source destination
```

**Practical example**
```bash
mv -i -- ./old.txt ./new.txt
```

`-i` prompts if the destination would be overwritten. `--` ends option parsing.

**What happens internally?**

On the same file system, `mv` normally changes the directory entry without copying file data. Across file systems, GNU `mv` normally copies the data and then removes the source. Success usually prints nothing.

**When should I use it?**

Rename a file or move a finished report into an output directory.

**What should I remember?**

An existing destination directory is normally treated as a container. GNU `-T` forces the final operand to be treated as the exact destination. A move across file systems is not atomic.

[Upstream reference](https://www.gnu.org/software/coreutils/manual/html_node/mv-invocation.html)
