<!-- cut — Extract columns or fields -->
<a name="cut--extract-columns-or-fields"></a>

```text
╔═════════════════════════════╗
║  ██████ ██    ██ ████████   ║
║ ██ ░░░░░██░░  ██░░ ░██░░░░░ ║
║ ██░░    ██░░  ██░░  ██░░    ║
║ ██░░    ██░░  ██░░  ██░░    ║
║  ██████  ██████ ░░  ██░░    ║
║    ░░░░░░  ░░░░░░     ░░    ║
╚═════════════════════════════╝
```

*Extract columns or fields*

[**English**](cut.md) | [Español](../../../es/03-comandos/texto/cut.md)

[Command dictionary](../README.md) · [Practice files](../README.md#practice-files)

**What does it do?**

Extracts selected fields or positions from each input line.

**Basic syntax**
```bash
cut -d delimiter -f list [file ...]
```

**Practical example**
```bash
cut -d ':' -f 1 ./usage.txt
```

`-d ':'` sets a colon as the field delimiter and `-f 1` selects the first field. The sample prints `root` and `data` on separate lines.

**What happens internally?**

`cut` scans each line for delimiters, numbers fields from 1 and writes the selected fields in their input order. A line with no delimiter passes through by default.

**When should I use it?**

Extract an identifier from a consistently delimited list.

**What should I remember?**

Use `-s` to skip lines without the delimiter. For quoted CSV, use a CSV parser. In [GNU Coreutils before 9.11](https://lists.gnu.org/archive/html/coreutils-announce/2026-04/msg00000.html), `-c` selects byte positions like `-b`.

[Upstream reference](https://www.gnu.org/software/coreutils/manual/html_node/cut-invocation.html)
