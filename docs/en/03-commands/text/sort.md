<!-- sort — Sort text lines -->
<a name="sort--sort-text-lines"></a>

```text
╔═════════════════════════════════════╗
║ ███████  ██████  ██████  ████████   ║
║ ██░░░░░░██ ░░░██░██░░░██░  ░██░░░░░ ║
║ ███████ ██░░  ██░██████ ░░  ██░░    ║
║   ░░░██░██░░  ██░██░░░██░   ██░░    ║
║ ███████░░██████ ░██░░ ██░░  ██░░    ║
║   ░░░░░░░  ░░░░░░  ░░   ░░    ░░    ║
╚═════════════════════════════════════╝
```

*Sort text lines*

[**English**](sort.md) | [Español](../../../es/03-comandos/texto/sort.md)

[Command dictionary](../README.md)

**What does it do?**

Sorts text lines using comparison rules you can select.

**Basic syntax**
```bash
sort [options] [file ...]
```

**Practical example**
```bash
printf '%s\n' 10 2 30 | LC_ALL=C sort -n
```

`-n` compares an initial numeric value. `LC_ALL=C` supplies locale settings for this invocation. The result is `2`, `10`, `30`, one value per line.

**What happens internally?**

Bash connects `printf` to `sort` through a pipe. `sort` compares the numbers at the start of each line and writes the reordered lines. Large inputs can require temporary files.

**When should I use it?**

Order a report by a value at the start of each line or make samples reproducible across machines.

**What should I remember?**

Alphabetical collation and numeric conventions depend on the locale. GNU `sort -h` can compare size suffixes such as `K` and `M`, while `-n` handles plain numbers.

[Upstream reference](https://www.gnu.org/software/coreutils/manual/html_node/sort-invocation.html)
