<!-- Parsing arguments -->
<a name="parsing-arguments"></a>

```text
██████╗  █████╗ ██████╗ ███████╗███████╗     █████╗ ██████╗  ██████╗ ███████╗
██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝    ██╔══██╗██╔══██╗██╔════╝ ██╔════╝
██████╔╝███████║██████╔╝███████╗█████╗      ███████║██████╔╝██║  ███╗███████╗
██╔═══╝ ██╔══██║██╔══██╗╚════██║██╔══╝      ██╔══██║██╔══██╗██║   ██║╚════██║
██║     ██║  ██║██║  ██║███████║███████╗    ██║  ██║██║  ██║╚██████╔╝███████║
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝
```

*Parsing arguments*

[**English**](parsing-arguments.md) | [Español](../../es/04-patrones/procesamiento-de-argumentos.md)

[Section index](README.md)

## Check the number of arguments

**Problem:** Require exactly one operand before reading it.

**Solution**
```bash
if (( $# != 1 )); then
  printf 'Usage: %s FILE\n' "$0" >&2
  exit 2
fi
file=$1
```

**Why it works:** `$#` counts the arguments. The script reports a usage error before expanding an absent `$1`.

**When to use it:** Validate scripts with a fixed number of operands.

## Parse short options with getopts

**Problem:** Read `-f FORMAT` before optional positional operands. Save the snippet as `parse.sh` and try `bash parse.sh -f json -- 'report file.txt'`.

**Solution**
```bash
format=text
while getopts ':f:' option; do
  case $option in
    f) format=$OPTARG ;;
    :) printf 'Option -%s needs a value.\n' "$OPTARG" >&2; exit 2 ;;
    \?) printf 'Unknown option -%s.\n' "$OPTARG" >&2; exit 2 ;;
  esac
done
shift "$(( OPTIND - 1 ))"
printf 'Format: %s. Operands: %s\n' "$format" "$#"
```

**Why it works:** In `:f:`, the first colon enables custom error reporting. The colon after `f` marks a required option value. Bash writes that value to `OPTARG`. After the loop, `OPTIND` marks the first unprocessed argument.

**When to use it:** Parse a small set of short options. Put options before operands and use `--` to end option parsing explicitly. For a fresh parse in the same shell, reset `OPTIND=1`.

## Reuse a function for diagnostics

**Problem:** Keep repeated diagnostics consistent.

**Solution**
```bash
warn() {
  printf 'Warning: %s\n' "$1" >&2
}
[[ -r ./report.txt ]] || warn 'report.txt is unavailable.'
```

**Why it works:** The function takes a single string and sends it to standard error through a fixed `printf` format.

**When to use it:** Share a message style across validation and execution steps. Return or exit explicitly at the call site when a failure must stop execution.
