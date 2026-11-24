# du — Estimate space used by paths

[**English**](du.md) | [Español](../../../es/03-comandos/sistema/du.md)

[Command dictionary](../README.md) · [Practice files](../README.md#practice-files)

**What does it do?**

Estimates disk usage attributed to files and directories.

**Basic syntax**
```bash
du [options] [path ...]
```

**Practical example**
```bash
du -sh -- './sample data'
```

`-s` prints one total per supplied path and `-h` formats sizes for people. `--` ends option parsing.

**What happens internally?**

`du` traverses the directory tree and adds up the allocated blocks reported for its entries. By default, multiple hard links to the same file are counted once.

**When should I use it?**

Find a directory that accounts for substantial disk usage or compare trees.

**What should I remember?**

A sparse file can occupy less disk space than its length suggests. GNU `--apparent-size` reports logical size. `-h` is outside POSIX.

[Upstream reference](https://www.gnu.org/software/coreutils/manual/html_node/du-invocation.html)
