<!-- Security -->
<a name="security"></a>

```text
███████╗███████╗ ██████╗██╗   ██╗██████╗ ██╗████████╗██╗   ██╗
██╔════╝██╔════╝██╔════╝██║   ██║██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝
███████╗█████╗  ██║     ██║   ██║██████╔╝██║   ██║    ╚████╔╝
╚════██║██╔══╝  ██║     ██║   ██║██╔══██╗██║   ██║     ╚██╔╝
███████║███████╗╚██████╗╚██████╔╝██║  ██║██║   ██║      ██║
╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝
```

[**English**](security.md) | [Español](../../es/07-buenas-practicas/seguridad.md)

[Section index](README.md)

## Keep input as data

Quote expansions in command arguments. For tools that support it, place `--` before path operands to prevent option parsing. Keep command syntax fixed and pass variable values through arguments. Use a fixed `printf` format such as `printf '%s\n' "$value"`.

Use a data format for untrusted configuration. `source` and `eval` interpret text as shell code. Validate numeric text before using `(( ))` or `$(( ))`, where Bash can interpret variable contents as expressions.

## Use private temporary files

```bash
scratch=$(mktemp -d) || exit 1
report="$scratch/result.txt"
printf '%s\n' 'example data' > "$report"
rm -- "$report"
rmdir -- "$scratch"
```

`mktemp -d` creates a private directory with an unpredictable name. The example removes only the file and directory it just created. For longer scripts, register an exit trap immediately after successful creation so ordinary failures also trigger cleanup.

## Limit access

Run a script with the permissions it actually needs. Use trusted directories and an explicit `PATH` for scheduled jobs. Use `umask 077` when new data files should be private. Trace scripts only where expanded values are safe to expose.

[GNU mktemp manual](https://www.gnu.org/software/coreutils/manual/html_node/mktemp-invocation.html)
