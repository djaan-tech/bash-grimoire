# Conditionals

[**English**](conditionals.md) | [Español](../../es/02-sintaxis/condicionales.md)

[Section index](README.md)

## if, elif and else

**What it is:** `if` selects a branch based on the status of a command or command list.

**Syntax**
```bash
if command; then
  action
elif other_command; then
  other_action
else
  fallback
fi
```

**Example**
```bash
count=3
if (( count > 5 )); then
  printf '%s\n' 'many'
elif (( count > 0 )); then
  printf '%s\n' 'some'
else
  printf '%s\n' 'none'
fi
```

**How it works:** Bash runs each condition in order and enters the first branch whose condition succeeds. `else` handles the remaining case.

**When to use it:** Run a step only after a check succeeds or choose between several states.

**Important:** `elif` and `else` are optional. Bash uses the exit status even when the command prints text.

## File and string tests

**What it is:** `[[ ]]` is Bash syntax for file, string and numeric tests.

**Syntax**
```bash
[[ -f path ]]
[[ value == pattern ]]
[[ value =~ regex ]]
```

**Example**
```bash
name=report.txt
if [[ $name == *.txt ]]; then
  printf '%s\n' "$name"
fi
```

**How it works:** Bash evaluates the expression and returns zero when it is true. Within `[[ ]]`, Bash skips word splitting and filename expansion. The unquoted right side of `==` is a shell pattern.

**When to use it:** Test a file type, compare text or validate a format with `=~`.

**Important:** Quote the right side of `==` for a literal comparison. With `=~`, quoting a portion makes that portion literal. POSIX `sh` uses tests such as `[ -f "$path" ]`.

## Strings and numbers

**What it is:** `=` compares strings in a test.
`-eq` compares integers.

**Syntax**
```bash
[[ $text = "$other_text" ]]
[[ $number -eq $other_number ]]
(( number >= limit ))
```

**Example**
```bash
value=010
[[ $value = '10' ]] || printf '%s\n' 'different text'
[[ $value -eq 8 ]] && printf '%s\n' 'octal value is eight'
```

**How it works:** Bash evaluates numeric operands in `[[ ]]` as arithmetic expressions. The leading zero makes `010` octal, so its numeric value is `8`. Other numeric operators include `-ne`, `-lt`, `-le`, `-gt` and `-ge`. In `(( ))`, use operators such as `==` and `>=`.

**When to use it:** Compare a file extension as text and a count as a number.

**Important:** Untrusted strings can be interpreted as arithmetic expressions. [Validate the digits and range](../04-patterns/validating-data.md#validate-a-numeric-argument) before evaluating the number.

## case

**What it is:** `case` chooses a branch by matching a word against shell patterns.

**Syntax**
```bash
case word in
  pattern) action ;;
  *) fallback ;;
esac
```

**Example**
```bash
mode=report
case $mode in
  report|summary) printf '%s\n' 'show results' ;;
  *) printf '%s\n' 'unknown mode' >&2 ;;
esac
```

**How it works:** Bash tests patterns in order. `|` joins alternatives within a branch. `;;` ends the selected branch. `*` can serve as a catch-all.

**When to use it:** Dispatch subcommands or classify input by suffix.

**Important:** Patterns use shell wildcard syntax. Put specific cases before `*`.

[Conditional constructs](https://www.gnu.org/software/bash/manual/html_node/Conditional-Constructs.html) · [Bash conditional expressions](https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html)
