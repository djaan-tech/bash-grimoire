# Process substitution

[**English**](process-substitution.md) | [Español](../../es/apendice/sustitucion-de-procesos.md)

[Appendix](README.md) · [Reading and iterating over files](../04-patterns/reading-files.md)

**What it is:** Process substitution exposes a command’s input or output as a path another command can open.

| Form | What it lets you do |
| --- | --- |
| `<(command)` | Open the path to read `command`’s standard output. |
| `>(command)` | Open the path to send data to `command`’s standard input. |

**Example**
```bash
count=0
while IFS= read -r line; do
  printf '%s\n' "$line"
  count=$((count + 1))
done < <(printf '%s\n' alpha beta)
printf 'Total: %d\n' "$count"
```

**How it works:** In `< <(...)`, the first `<` redirects the loop’s input. Bash runs the producer in `<(...)` asynchronously and expands the expression to a path. The loop reads the stream in the current shell, so it can print `Total: 2` afterwards.

**When to use it:** Process output one line at a time or supply it to a tool that expects a path and can read a stream. To save the output as text in a variable, use [command substitution](../02-syntax/quoting-and-expansions.md#command-substitution).

**Important:** Write `<(` or `>(` without a space between the symbols. The producer has its own exit status. If you need to check it, you can generate the data in a separate step and run the loop only if that step succeeds.

[Process substitution in the GNU Bash manual](https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html)
