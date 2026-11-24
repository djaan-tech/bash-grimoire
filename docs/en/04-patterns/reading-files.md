<!-- Reading and iterating over files -->
<a name="reading-and-iterating-over-files"></a>

```text
╔════════════════════════════════════════════════════════════════════════════════════════════════╗
║ ██████  ███████  █████  ██████  ██ ███    ██  ██████      ███████ ██ ██      ███████ ███████   ║
║ ██░░░██░██░░░░░░██ ░░██░██░░░██░██░████░  ██░██ ░░░░░░    ██░░░░░░██░██░░    ██░░░░░░██░░░░░░░ ║
║ ██████ ░█████   ███████░██░░ ██░██░██░██░ ██░██░░ ███     █████   ██░██░░    █████   ███████   ║
║ ██░░░██░██░░░░░ ██░░░██░██░░ ██░██░██░░██░██░██░░  ██░░   ██░░░░░ ██░██░░    ██░░░░░   ░░░██░░ ║
║ ██░░ ██░███████ ██░░ ██░██████ ░██░██░░ ████░░██████ ░░   ██░░    ██░███████ ███████ ███████░░ ║
║   ░░   ░░ ░░░░░░░ ░░   ░░ ░░░░░░  ░░ ░░   ░░░░  ░░░░░░      ░░      ░░ ░░░░░░░ ░░░░░░░ ░░░░░░░ ║
╚════════════════════════════════════════════════════════════════════════════════════════════════╝
```

*Reading and iterating over files*

[**English**](reading-files.md) | [Español](../../es/04-patrones/lectura-de-archivos.md)

[Section index](README.md) · [Practice files](../03-commands/README.md#practice-files)

## Read one line at a time

**Problem:** Read a text file while preserving whitespace and backslashes.

**Solution**
```bash
log='sample data/notes file.txt'
while IFS= read -r line || [[ -n $line ]]; do
  printf '%s\n' "$line"
done < "$log"
```

**Why it works:** `IFS= read -r` preserves both. The second condition processes the final line even though the sample file ends without a newline. Redirecting the entire loop keeps its variables in the current shell.

**When to use it:** Process logs and line-based formats. Check that a required file can be opened and handle redirection failures.

## Visit matching files

**Problem:** Apply an operation to text files in one directory, including names with spaces.

**Solution**
```bash
directory='sample data'
for file in "$directory"/*.txt; do
  [[ -f $file ]] || continue
  printf '%s\n' "$file"
done
```

**Why it works:** Bash expands only the unquoted `*.txt`. Each match is a separate word. The test skips directories and the unexpanded glob when it matches nothing.

**When to use it:** Visit visible regular files or links to them at one directory level. Use [`find`](../03-commands/files/find.md) for recursive traversal.

## Pass a path safely

**Problem:** Pass a filename that may contain spaces, wildcards or an initial hyphen.

**Solution**
```bash
file='sample data/notes file.txt'
wc -l < "$file"
```

**Why it works:** The quoted expansion supplies one path to Bash’s redirection. `wc` reads standard input, so it never parses the name as an option.

**When to use it:** Use redirection for programs that can read one file from standard input. For a file operand use `-- "$file"` when the program supports `--`. A bare `-` may still mean standard input, so use `./-` for that filename.
