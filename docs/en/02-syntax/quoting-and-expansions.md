<!-- Quoting and expansions -->
<a name="quoting-and-expansions"></a>

```text
╔═══════════════════════════════════════════════════════════════════════════════════════════╗
║  ██████  ██    ██  ██████  ████████ ██ ███    ██  ██████       █████  ███    ██ ██████    ║
║ ██ ░░░██░██░░  ██░██ ░░░██░  ░██░░░░██░████░  ██░██ ░░░░░░    ██ ░░██░████░  ██░██░░░██░  ║
║ ██░░  ██░██░░  ██░██░░  ██░░  ██░░  ██░██░██░ ██░██░░ ███     ███████░██░██░ ██░██░░ ██░░ ║
║ ██░▄▄ ██░██░░  ██░██░░  ██░░  ██░░  ██░██░░██░██░██░░  ██░░   ██░░░██░██░░██░██░██░░ ██░░ ║
║  ██████ ░░██████ ░░██████ ░░  ██░░  ██░██░░ ████░░██████ ░░   ██░░ ██░██░░ ████░██████ ░░ ║
║    ░▀▀░░░   ░░░░░░   ░░░░░░     ░░    ░░ ░░   ░░░░  ░░░░░░      ░░   ░░ ░░   ░░░░ ░░░░░░  ║
║       ░░                                                                                  ║
║ ███████ ██   ██ ██████   █████  ███    ██ ███████ ██  ██████  ███    ██ ███████           ║
║ ██░░░░░░░██░██ ░██░░░██░██ ░░██░████░  ██░██░░░░░░██░██ ░░░██░████░  ██░██░░░░░░░         ║
║ █████     ███ ░░██████ ░███████░██░██░ ██░███████ ██░██░░  ██░██░██░ ██░███████           ║
║ ██░░░░░  ██ ██░ ██░░░░░░██░░░██░██░░██░██░░ ░░░██░██░██░░  ██░██░░██░██░░ ░░░██░░         ║
║ ███████ ██ ░░██░██░░    ██░░ ██░██░░ ████░███████░██░░██████ ░██░░ ████░███████░░         ║
║   ░░░░░░░ ░░   ░░ ░░      ░░   ░░ ░░   ░░░░ ░░░░░░░ ░░  ░░░░░░  ░░   ░░░░ ░░░░░░░         ║
╚═══════════════════════════════════════════════════════════════════════════════════════════╝
```

[**English**](quoting-and-expansions.md) | [Español](../../es/02-sintaxis/comillas-y-expansiones.md)

[Section index](README.md)

## Single and double quotes

**What it is:** Quoting controls which parts of a word Bash interprets and expands.

**Syntax**
```bash
'literal text'
"$variable"
```

**Example**
```bash
name='annual report'
printf '<%s>\n' '$name' "$name"
printf '<%s>\n' $name
```

**How it works:** Single quotes preserve literal text. Double quotes allow parameter expansion, command substitution and arithmetic expansion while protecting ordinary results from word splitting and filename expansion. The last `printf` produces `<annual>` and `<report>` on separate lines because the expansion has no quotes.

**When to use it:** Quote paths, arguments and text that may contain spaces or wildcard characters.

**Important:** A single quote cannot occur inside single quotes. [`"$@"`](arguments.md#forward-or-join-arguments) preserves one word per argument.

## Parameter expansion

**What it is:** Parameter expansion substitutes a value or applies an operation to it.

**Syntax**
```bash
"$name"
"${name}"
"${name:-fallback}"
```

**Example**
```bash
report=weekly
suffix=''
printf '%s\n' "${report}${suffix:-.txt}" "${report}${suffix-.txt}"
```

**How it works:** Braces mark where the parameter name ends. An empty variable has a value (`''`). An unset variable has no value. Since `suffix` is empty, the example prints `weekly.txt` with `:-` and `weekly` with `-`.

**When to use it:** Supply defaults for optional settings or build a filename.

| Form | When it applies | Effect |
| --- | --- | --- |
| `${name-fallback}` | Unset | Uses the fallback in the expansion. |
| `${name:-fallback}` | Unset or empty | Uses the fallback in the expansion. |
| `${name:=fallback}` | Unset or empty | Assigns the fallback to the variable and expands it. |
| `${name:?message}` | Unset or empty | Writes the message to standard error and exits if Bash is noninteractive. |

**Important:** The first two forms leave the variable unchanged. Quote the expansion in ordinary commands.

## Command substitution

**What it is:** Command substitution places a command’s standard output into an expansion.

**Syntax**
```bash
value=$(command)
```

**Example**
```bash
value=$(printf '%s\n' total)
printf '[%s]\n' "$value"
```

**How it works:** Bash runs the command in a subshell and removes trailing newline characters from its standard output. Standard error keeps its usual destination.

**When to use it:** Capture a short result such as a date, a count or a generated label.

**Important:** Quote `"$(command)"` when using the result as an argument. Bash strings cannot represent NUL bytes. Use a file or a stream for binary data.

To pass output as if it were a file, see [process substitution](../appendix/process-substitution.md).

## Arithmetic expansion

**What it is:** Arithmetic expansion evaluates an integer expression and substitutes its result.

**Syntax**
```bash
"$(( expression ))"
```

**Example**
```bash
count=4
printf '%s\n' "$(( count + 1 ))"
```

**How it works:** Bash looks up variables referenced by name inside the expression and calculates the result using fixed-width integer arithmetic.

**When to use it:** Increment a counter or compute an integer percentage.

**Important:** Integer literals with a leading zero are octal. For validated unsigned decimal digits use `10#`, for example `$(( 10#08 ))`. Validate text and range before evaluating user input.

## Filename expansion

**What it is:** Filename expansion, also called globbing, turns patterns into matching paths.

**Syntax**
```bash
command directory/*.ext
```

**Example**
```bash
# From the repository root
printf '%s\n' examples/*.sh
```

**How it works:** After word splitting, Bash expands unquoted `*`, `?` and bracket patterns. Each matched path is passed as its own argument, even when it contains spaces.

**When to use it:** Select files by name before passing them to a command.

**Important:** An unmatched pattern remains literal by default. With `nullglob` it disappears, and with `failglob` Bash reports an error. Leading dots require an explicit dot or `dotglob` in the usual configuration.

[Shell expansions](https://www.gnu.org/software/bash/manual/html_node/Shell-Expansions.html) · [Quoting](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
