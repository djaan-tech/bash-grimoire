<!-- Handling errors -->
<a name="handling-errors"></a>

```text
╔═══════════════════════════════════════════════════════════════════╗
║ ██   ██  █████  ███    ██ ██████  ██      ██ ███    ██  ██████    ║
║ ██░░ ██░██ ░░██░████░  ██░██░░░██░██░░    ██░████░  ██░██ ░░░░░░  ║
║ ███████░███████░██░██░ ██░██░░ ██░██░░    ██░██░██░ ██░██░░ ███   ║
║ ██░░░██░██░░░██░██░░██░██░██░░ ██░██░░    ██░██░░██░██░██░░  ██░░ ║
║ ██░░ ██░██░░ ██░██░░ ████░██████ ░███████ ██░██░░ ████░░██████ ░░ ║
║   ░░   ░░ ░░   ░░ ░░   ░░░░ ░░░░░░  ░░░░░░░ ░░ ░░   ░░░░  ░░░░░░  ║
║                                                                   ║
║ ███████ ██████  ██████   ██████  ██████  ███████                  ║
║ ██░░░░░░██░░░██░██░░░██░██ ░░░██░██░░░██░██░░░░░░░                ║
║ █████   ██████ ░██████ ░██░░  ██░██████ ░███████                  ║
║ ██░░░░░ ██░░░██░██░░░██░██░░  ██░██░░░██░  ░░░██░░                ║
║ ███████ ██░░ ██░██░░ ██░░██████ ░██░░ ██░███████░░                ║
║   ░░░░░░░ ░░   ░░ ░░   ░░  ░░░░░░  ░░   ░░ ░░░░░░░                ║
╚═══════════════════════════════════════════════════════════════════╝
```

[**English**](handling-errors.md) | [Español](../../es/04-patrones/gestion-de-errores.md)

[Section index](README.md)

## Capture output and check its status

**Problem:** Use a command’s output only if the command succeeds.

**Solution**
```bash
if stamp=$(date -u +%Y-%m-%d); then
  printf '%s\n' "$stamp"
else
  status=$?
  printf 'date failed (%s)\n' "$status" >&2
  exit "$status"
fi
```

**Why it works:** An assignment without a command adopts the status of its substitution. In the `else` branch, `$?` still holds that status.

**When to use it:** Capture a date, a count or a path. Store `$?` immediately if you will use it later.

## Handle an expected nonzero status

**Problem:** Distinguish an empty search result from a failed search. Try it on the [practice log](../03-commands/README.md#practice-files).

**Solution**
```bash
file=./app.log
if grep -F -e 'ERROR' -- "$file"; then
  :
else
  status=$?
  case $status in
    1) printf '%s\n' 'No matches.' ;;
    *) printf 'Search failed (%s)\n' "$status" >&2; exit "$status" ;;
  esac
fi
```

**Why it works:** `-F` matches fixed text, `-e` supplies the pattern and `--` ends option parsing. GNU `grep` opens the file and returns 1 for no matches or 2 on error. Bash’s `:` does nothing and returns zero.

**When to use it:** Use plain `if` when you need the original status. A failed shell redirection can also return 1 before `grep` runs. Pass the filename as an operand here so `grep` reports opening errors.

## set -e

**What it is:** `set -e` asks Bash to exit on an unhandled failing command or pipeline in certain contexts.

**Syntax**
```bash
set -e
set +e
```

**Example**
```bash
bash -c 'set -e; false; printf "%s\n" unreachable'
bash -c 'set -e; if false; then :; fi; printf "%s\n" survived'
```

**How it works:** Failures in `if`, `while` and `until` conditions, under `!`, and before the final command in an `&&` or `||` list keep their status without making Bash exit. With `pipefail`, a failure in an earlier stage can determine the pipeline’s status. The exemption can carry into a function called in a condition.

**When to use it:** Use it as an additional safeguard in a script with well-defined failures. Handle expected failures explicitly.

**Important:** Bash normally clears `-e` inside `$(...)`. POSIX mode or Bash’s `inherit_errexit` preserves it there. The first demo exits with status 1.

## set -u

**What it is:** `set -u` treats most expansions of unset parameters as errors.

**Syntax**
```bash
set -u
set +u
```

**Example**
```bash
bash -c 'set -u; unset mode; printf "%s\n" "${mode:-brief}"'
```

**How it works:** Bash diagnoses the invalid expansion and a noninteractive shell exits. Default-value expansions such as `${mode:-brief}` handle an unset or empty variable.

**When to use it:** Catch misspelled variable names and require explicit defaults for optional inputs.

**Important:** `"$@"` and `"$*"` are exceptions. `set -u` still allows an assigned empty value.

## pipefail

**What it is:** `pipefail` changes the exit status Bash assigns to a pipeline.

**Syntax**
```bash
set -o pipefail
set +o pipefail
```

**Example**
```bash
bash -c 'set -o pipefail; false | true; printf "%s\n" "$?"'
```

**How it works:** With it enabled, Bash uses the status of the rightmost failing stage, or zero when every stage succeeds. The example prints `1`.

**When to use it:** Detect when a producer fails even though the consumer succeeds.

**Important:** A consumer that exits early, such as `grep -q` after a match, can cause a producer to fail with `SIGPIPE`. To identify individual stages, copy Bash’s `PIPESTATUS` array immediately.

[Options for the set builtin](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html)
