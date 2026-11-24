<!-- Loops -->
<a name="loops"></a>

```text
╔═════════════════════════════════════════════╗
║ ██       ██████   ██████  ██████  ███████   ║
║ ██░░    ██ ░░░██░██ ░░░██░██░░░██░██░░░░░░░ ║
║ ██░░    ██░░  ██░██░░  ██░██████ ░███████   ║
║ ██░░    ██░░  ██░██░░  ██░██░░░░░░  ░░░██░░ ║
║ ███████  ██████ ░░██████ ░██░░    ███████░░ ║
║   ░░░░░░░  ░░░░░░   ░░░░░░  ░░      ░░░░░░░ ║
╚═════════════════════════════════════════════╝
```

[**English**](loops.md) | [Español](../../es/02-sintaxis/bucles.md)

[Section index](README.md)

## for

**What it is:** `for` runs a body once for each word in a list.

**Syntax**
```bash
for item in word1 word2; do
  command "$item"
done
```

**Example**
```bash
for report in 'annual report.txt' 'budget.txt'; do
  printf '%s\n' "$report"
done
```

**How it works:** Bash expands the list and assigns the resulting words to the loop variable one at a time.

**When to use it:** Process arguments with `for item in "$@"` or visit paths from a glob.

**Important:** Keep expansions quoted when each value should stay whole. With no words, the loop runs zero times.

## while

**What it is:** `while` repeats a body while its condition succeeds.

**Syntax**
```bash
while condition; do
  command
done
```

**Example**
```bash
count=0
while (( count < 3 )); do
  printf '%s\n' "$count"
  count=$(( count + 1 ))
done
```

**How it works:** Bash runs the condition before each iteration. A nonzero status ends the loop.

**When to use it:** Read records until `read` reaches the end of input or monitor a condition with a bounded loop.

**Important:** Arrange for the condition to change or use an explicit `break`. `continue` starts the next iteration.

## until

**What it is:** `until` repeats a body while its condition returns nonzero.

**Syntax**
```bash
until condition; do
  command
done
```

**Example**
```bash
attempt=0
until (( attempt >= 3 )); do
  attempt=$(( attempt + 1 ))
  printf 'Attempt %s\n' "$attempt"
done
```

**How it works:** Bash tests the condition before each iteration. The loop ends when the test succeeds.

**When to use it:** Wait for a condition to become true, such as the arrival of a file.

**Important:** When waiting on external state, set a retry limit and add a delay between attempts.

[Looping constructs](https://www.gnu.org/software/bash/manual/html_node/Looping-Constructs.html)
