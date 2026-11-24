<!-- Octal permissions with chmod -->
<a name="octal-permissions-with-chmod"></a>

```text
╔═════════════════════════════════════════════════════════════════════════════════════════════╗
║  ██████   ██████ ████████  █████  ██          ███    ███  ██████  ██████  ███████ ███████   ║
║ ██ ░░░██░██ ░░░░░░ ░██░░░░██ ░░██░██░░        ████░ ████░██ ░░░██░██░░░██░██░░░░░░██░░░░░░░ ║
║ ██░░  ██░██░░       ██░░  ███████░██░░        ██░████ ██░██░░  ██░██░░ ██░█████   ███████   ║
║ ██░░  ██░██░░       ██░░  ██░░░██░██░░        ██░░██░░██░██░░  ██░██░░ ██░██░░░░░   ░░░██░░ ║
║  ██████ ░░██████    ██░░  ██░░ ██░███████     ██░░  ░░██░░██████ ░██████ ░███████ ███████░░ ║
║    ░░░░░░   ░░░░░░    ░░    ░░   ░░ ░░░░░░░     ░░      ░░  ░░░░░░  ░░░░░░  ░░░░░░░ ░░░░░░░ ║
╚═════════════════════════════════════════════════════════════════════════════════════════════╝
```

*Octal permissions with chmod*

[**English**](octal-permissions.md) | [Español](../../es/apendice/permisos-octales.md)

[Appendix](README.md) · [chmod card](../03-commands/system/chmod.md)

## How to read the three digits

`chmod` reads numeric modes in **octal** (base 8). The last three digits apply to the owner (`u` for *user*), group (`g`) and others (`o`), from left to right. Each digit adds `4` for read, `2` for write and `1` for execute. An unset permission contributes zero.

```text
+-------------+-----------------+-----------------+-----------------+
|             |    Owner (u)    |    Group (g)    |    Others (o)   |
+-------------+-----+-----+-----+-----+-----+-----+-----+-----+-----+
| Permission  |  r  |  w  |  x  |  r  |  w  |  x  |  r  |  w  |  x  |
| Octal value | 400 | 200 | 100 |  40 |  20 |  10 |   4 |   2 |   1 |
+-------------+-----+-----+-----+-----+-----+-----+-----+-----+-----+
```

For example, granting group write adds `020` to the mode if that bit was previously unset. Each letter has a different weight depending on its position.

## What r, w and x mean

| Letter | Value within the digit | On a file | On a directory |
| --- | --- | --- | --- |
| `r` (*read*) | `4` | Read the contents. | List entry names. |
| `w` (*write*) | `2` | Modify the contents. | With `x`, create, remove or rename entries if the other access rules permit it. |
| `x` (*execute*) | `1` | Run the file if its format permits it. | Traverse the directory and access entries by name. |

In `ls -l` output, a dash `-` inside a triplet means that permission is unset. The first character shows the file type. In `-rwxr-x---`, the leading dash marks a regular file. A directory starts with `d`.

## Calculate and check a mode

- `750` → `7 = 4 + 2 + 1` (`rwx`), `5 = 4 + 1` (`r-x`), `0` (`---`).
- `444` → `4` (`r--`) in all three classes. It clears the basic write and execute bits for all three.

Try both modes on a temporary file on GNU/Linux. `stat -c` displays the mode in octal (`%a`) and in letters (`%A`).

```bash
(
  file=$(mktemp) || exit 1
  trap 'rm -f -- "$file"' EXIT
  chmod 750 -- "$file" || exit 1
  stat -c '%a %A' -- "$file" || exit 1
  chmod 444 -- "$file" || exit 1
  stat -c '%a %A' -- "$file"
)
```

```text
750 -rwxr-x---
444 -r--r--r--
```

Git Bash on Windows can report different permissions on Windows file systems.

A mode such as `750` sets all nine basic bits. Use `chmod u+x -- "$file"` to add only owner execute permission and preserve the other basic bits.

## The fourth digit

A leading digit can represent special bits. `4` is *setuid*, `2` is *setgid* and `1` is the *sticky bit*. On compatible executables, *setuid* and *setgid* can change the process’s effective user or group. On directories, *setgid* makes files created there inherit the directory’s group and the *sticky bit* limits who can remove or rename entries.

GNU `chmod` can preserve *setuid* and *setgid* on directories unless the mode explicitly clears them.

[GNU Coreutils numeric modes](https://www.gnu.org/software/coreutils/manual/html_node/Numeric-Modes.html) · [Mode structure and special bits](https://www.gnu.org/software/coreutils/manual/html_node/Mode-Structure.html)
