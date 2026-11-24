# cp — Copy files and directories

[**English**](cp.md) | [Español](../../../es/03-comandos/archivos/cp.md)

[Command dictionary](../README.md) · [Practice files](../README.md#practice-files)

**What does it do?**

Copies file data to another path. It can also copy a directory tree.

**Basic syntax**
```bash
cp [options] source destination
```

**Practical example**
```bash
cp -i -- ./report.txt './report copy.txt'
```

`-i` prompts before overwriting an existing destination. `--` ends option parsing.

**What happens internally?**

Bash preserves the quoted destination as one argument. `cp` opens the source for reading and opens or creates the destination for writing. A successful copy normally prints nothing.

**When should I use it?**

Create a working copy of a file or copy a directory tree with `-R`.

**What should I remember?**

If the destination is a directory, `cp` writes inside it. Use `-R` for portable recursive syntax and check which metadata your options preserve.

[Upstream reference](https://www.gnu.org/software/coreutils/manual/html_node/cp-invocation.html)
