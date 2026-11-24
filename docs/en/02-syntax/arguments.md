<!-- Arguments -->
<a name="arguments"></a>

```text
 █████╗ ██████╗  ██████╗ ██╗   ██╗███╗   ███╗███████╗███╗   ██╗████████╗███████╗
██╔══██╗██╔══██╗██╔════╝ ██║   ██║████╗ ████║██╔════╝████╗  ██║╚══██╔══╝██╔════╝
███████║██████╔╝██║  ███╗██║   ██║██╔████╔██║█████╗  ██╔██╗ ██║   ██║   ███████╗
██╔══██║██╔══██╗██║   ██║██║   ██║██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   ╚════██║
██║  ██║██║  ██║╚██████╔╝╚██████╔╝██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   ███████║
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝
```

[**English**](arguments.md) | [Español](../../es/02-sintaxis/argumentos.md)

[Section index](README.md)

## Positional parameters

**What it is:** Bash exposes arguments as `$1`, `$2` and so on.
`$#` gives their count and `$0` identifies the invocation.

**Syntax**
```bash
script.sh first second
printf '%s\n' "$0" "$#" "$1" "${2-}"
```

**Example**
```bash
bash -c 'printf "%s: %s argument(s)\n" "$0" "$#"; printf "<%s>\n" "$1" "$2"' demo 'two words' last
```

**How it works:** Bash assigns each argument it receives to a separate positional parameter. For `bash -c`, the first argument after the command string becomes `$0`. Use braces from `${10}` onwards.

**When to use it:** Read a path, a threshold or a mode passed to a script.

**Important:** Check `$#` first when a parameter is required. `${1-default}` supplies a default only if the parameter is absent.

## Forward or join arguments

**What it is:** `"$@"` preserves every argument as a separate word.
`"$*"` joins the arguments into one word.

**Syntax**
```bash
command "$@"
printf '%s\n' "$*"
shift [count]
```

**Example**
```bash
(
  set -- 'two words' 'last'
  printf '<%s>\n' "$@"
  printf 'Joined: %s\n' "$*"
  shift
  printf 'Remaining: %s\n' "$1"
)
```

**How it works:** For `"$*"`, Bash uses the first character of `IFS` as the separator, a space if `IFS` is unset or no separator if `IFS` is empty. `shift` discards leading parameters and renumbers the remaining ones.

**When to use it:** Forward arguments with `"$@"` and use `shift` to consume arguments in order.

**Important:** With no arguments, `"$@"` expands to zero words. Check that enough arguments remain before calling `shift`.

[Special parameters](https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html)
