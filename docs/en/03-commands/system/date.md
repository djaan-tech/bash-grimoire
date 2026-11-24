<!-- date — Read and format the system time -->
<a name="date--read-and-format-the-system-time"></a>

```text
██████╗  █████╗ ████████╗███████╗
██╔══██╗██╔══██╗╚══██╔══╝██╔════╝
██║  ██║███████║   ██║   █████╗
██║  ██║██╔══██║   ██║   ██╔══╝
██████╔╝██║  ██║   ██║   ███████╗
╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
```

*Read and format the system time*

[**English**](date.md) | [Español](../../../es/03-comandos/sistema/date.md)

[Command dictionary](../README.md)

**What does it do?**

Displays the current date and time in a chosen format.

**Basic syntax**
```bash
date [options] +FORMAT
```

**Practical example**
```bash
date -u '+%Y-%m-%dT%H:%M:%SZ'
```

`-u` uses UTC. The `+` introduces the format. `%Y-%m-%d` supplies the date, `%H:%M:%S` supplies the time and the literal `T` and `Z` mark the date/time separator and UTC.

**What happens internally?**

Bash passes the whole format as one argument. `date` reads the clock, converts the time to UTC for `-u` and expands each `%` directive in the output.

**When should I use it?**

Add a timestamp to a log record or a generated filename.

**What should I remember?**

The example uses portable formatting directives. GNU `date -d` parses a date string. BSD variants use different options for similar tasks.

[Upstream reference](https://www.gnu.org/software/coreutils/manual/html_node/date-invocation.html)
