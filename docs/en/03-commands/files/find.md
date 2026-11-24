<!-- find — Search a directory tree -->
<a name="find--search-a-directory-tree"></a>

```text
╔════════════════════════════════╗
║ ███████ ██ ███    ██ ██████    ║
║ ██░░░░░░██░████░  ██░██░░░██░  ║
║ █████   ██░██░██░ ██░██░░ ██░░ ║
║ ██░░░░░ ██░██░░██░██░██░░ ██░░ ║
║ ██░░    ██░██░░ ████░██████ ░░ ║
║   ░░      ░░ ░░   ░░░░ ░░░░░░  ║
╚════════════════════════════════╝
```

*Search a directory tree*

[**English**](find.md) | [Español](../../../es/03-comandos/archivos/find.md)

[Command dictionary](../README.md) · [Practice files](../README.md#practice-files)

**What does it do?**

Walks a directory tree, tests each path and performs the requested action on matches.

**Basic syntax**
```bash
find start-path [expression]
```

**Practical example**
```bash
find . -type f -name '*.log' -print
```

`-type f` selects regular files, `-name '*.log'` matches the last path component and `-print` writes matching paths. The practice directory includes `./app.log`.

**What happens internally?**

Bash passes `'*.log'` as a literal pattern. `find` visits each entry under `.`. It checks `-type` and `-name` before running `-print` for a match.

**When should I use it?**

Locate files by name or type. Pass matches directly to a command with `-exec command {} +`.

**What should I remember?**

For names that may include newlines, use `-exec` or NUL-delimited `-print0` with a matching reader. `-print0` entered POSIX in 2024 and may be absent on older systems.

[Upstream reference](https://www.gnu.org/software/findutils/manual/)
