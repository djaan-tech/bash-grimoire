<!-- sed — Edit a text stream -->
<a name="sed--edit-a-text-stream"></a>

```text
╔═══════════════════════════╗
║ ███████ ███████ ██████    ║
║ ██░░░░░░██░░░░░░██░░░██░  ║
║ ███████ █████   ██░░ ██░░ ║
║   ░░░██░██░░░░░ ██░░ ██░░ ║
║ ███████░███████ ██████ ░░ ║
║   ░░░░░░░ ░░░░░░░ ░░░░░░  ║
╚═══════════════════════════╝
```

*Edit a text stream*

[**English**](sed.md) | [Español](../../../es/03-comandos/texto/sed.md)

[Command dictionary](../README.md) · [Practice files](../README.md#practice-files)

**What does it do?**

Transforms text according to an editing program.

**Basic syntax**
```bash
sed [options] 'script' [file ...]
```

**Practical example**
```bash
sed 's/ERROR/WARNING/g' ./app.log
```

`s` substitutes `WARNING` for `ERROR`. The `g` flag applies the change to every match on each line.

**What happens internally?**

Bash passes the editing expression as one argument. `sed` loads a line into its pattern space, applies the substitution and prints the resulting line by default.

**When should I use it?**

Replace text, select lines or normalise records before passing them down a pipeline.

**What should I remember?**

The example preserves the source file. The `-i` option edits files in place and its backup-suffix syntax differs between GNU and BSD `sed`. Preview the result before an in-place edit.

[Upstream reference](https://www.gnu.org/software/sed/manual/sed.html)
