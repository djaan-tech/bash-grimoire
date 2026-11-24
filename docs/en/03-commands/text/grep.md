# grep — Find matching lines

[**English**](grep.md) | [Español](../../../es/03-comandos/texto/grep.md)

[Command dictionary](../README.md) · [Practice files](../README.md#practice-files)

**What does it do?**

Selects lines that match a pattern in files or standard input.

**Basic syntax**
```bash
grep [options] -e 'pattern' [file ...]
```

**Practical example**
```bash
grep -nF -e 'ERROR' -- ./app.log
```

`-n` prefixes line numbers, `-F` selects fixed-string matching and `-e` supplies the pattern. `--` ends option parsing. The sample prints lines 2 and 3.

**What happens internally?**

`grep` opens the supplied file or reads standard input. With `-F` it searches each line for a literal substring and writes matching lines to standard output. Bash handles the quoting.

**When should I use it?**

Filter logs or check whether a configuration contains a particular string.

**What should I remember?**

GNU `grep` returns 0 for a match, 1 for no match and 2 for error. Other implementations may use another error code greater than 1. `-q` can return success after a match even if an error also occurred.

[Upstream reference](https://www.gnu.org/software/grep/manual/html_node/Exit-Status.html)
