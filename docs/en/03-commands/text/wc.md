<!-- wc — Count lines, words or bytes -->
<a name="wc--count-lines-words-or-bytes"></a>

```text
██╗    ██╗ ██████╗
██║    ██║██╔════╝
██║ █╗ ██║██║
██║███╗██║██║
╚███╔███╔╝╚██████╗
 ╚══╝╚══╝  ╚═════╝
```

*Count lines, words or bytes*

[**English**](wc.md) | [Español](../../../es/03-comandos/texto/wc.md)

[Command dictionary](../README.md) · [Practice files](../README.md#practice-files)

**What does it do?**

Counts newlines, words, bytes or characters in its input.

**Basic syntax**
```bash
wc [options] [file ...]
```

**Practical example**
```bash
wc -l < ./app.log
```

`-l` selects the newline count. The sample prints `3` without a filename.

**What happens internally?**

Bash opens the file for standard input. `wc` scans the stream for newline characters and prints the count. `-c` counts bytes and `-m` counts characters according to the locale.

**When should I use it?**

Count records in newline-terminated text or measure a file in bytes.

**What should I remember?**

A final line without a newline does not increase the `-l` count.

[Upstream reference](https://www.gnu.org/software/coreutils/manual/html_node/wc-invocation.html)
