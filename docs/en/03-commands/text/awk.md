<!-- awk — Process records and fields -->
<a name="awk--process-records-and-fields"></a>

```text
╔═════════════════════════════╗
║  █████  ██     ██ ██   ██   ║
║ ██ ░░██░██░░   ██░██░░██ ░░ ║
║ ███████░██░░█  ██░█████ ░░  ║
║ ██░░░██░██░███░██░██░░██░   ║
║ ██░░ ██░░███ ███ ░██░░ ██░  ║
║   ░░   ░░  ░░░ ░░░  ░░   ░░ ║
╚═════════════════════════════╝
```

*Process records and fields*

[**English**](awk.md) | [Español](../../../es/03-comandos/texto/awk.md)

[Command dictionary](../README.md) · [Practice files](../README.md#practice-files)

**What does it do?**

Processes structured text with rules that act on records and fields.

**Basic syntax**
```bash
awk [options] 'program' [file ...]
```

**Practical example**
```bash
awk -F ':' '$2 >= 90 { print $1 }' ./usage.txt
```

`-F ':'` sets the field separator to a colon. The rule prints the first field of each record whose second field is at least 90. With the sample data, it prints `root`.

**What happens internally?**

Single quotes keep Bash from expanding `$1` and `$2`. `awk` reads one record at a time, splits it into fields, then runs the action only when the condition matches. `print` adds a newline by default.

**When should I use it?**

Extract figures from simple delimited reports or calculate summaries.

**What should I remember?**

Pass external values with `awk -v name="$value"` and keep the `awk` program fixed. Basic delimiter splitting does not parse CSV fields containing quoted separators. GNU `awk` has additional features beyond POSIX.

[Upstream reference](https://www.gnu.org/software/gawk/manual/gawk.html)
