<!-- tar — Create or inspect an archive -->
<a name="tar--create-or-inspect-an-archive"></a>

```text
╔════════════════════════════╗
║ ████████  █████  ██████    ║
║   ░██░░░░██ ░░██░██░░░██░  ║
║    ██░░  ███████░██████ ░░ ║
║    ██░░  ██░░░██░██░░░██░  ║
║    ██░░  ██░░ ██░██░░ ██░░ ║
║      ░░    ░░   ░░ ░░   ░░ ║
╚════════════════════════════╝
```

*Create or inspect an archive*

[**English**](tar.md) | [Español](../../../es/03-comandos/sistema/tar.md)

[Command dictionary](../README.md) · [Practice files](../README.md#practice-files)

**What does it do?**

Groups files and their metadata into an archive. It can also list or extract archive members.

**Basic syntax**
```bash
tar -czf archive.tar.gz path ...
tar -tzf archive.tar.gz
```

**Practical example**
```bash
tar -czf ./reports.tar.gz ./report.txt
tar -tzf ./reports.tar.gz
```

`-c` creates an archive, `-t` lists members, `-z` uses gzip and `-f` selects the archive file. Run this in the practice directory. The listing shows `./report.txt`.

**What happens internally?**

GNU `tar` writes metadata and file data into one stream. With `-z` it sends that stream through gzip. With `-t`, it reads the archive and prints names without extracting files.

**When should I use it?**

Package a set of files for transfer or make a compressed directory backup.

**What should I remember?**

Creating an archive can overwrite the named output file. Inspect unfamiliar archives before extracting. Use a dedicated empty directory for extraction. `-z` needs a `tar` implementation with gzip support.

[Upstream reference](https://www.gnu.org/software/tar/manual/tar.html)
