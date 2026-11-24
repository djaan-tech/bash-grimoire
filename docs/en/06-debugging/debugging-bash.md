<!-- Debugging Bash -->
<a name="debugging-bash"></a>

```text
██████╗  █████╗ ███████╗██╗  ██╗    ██████╗ ███████╗██████╗ ██╗   ██╗ ██████╗
██╔══██╗██╔══██╗██╔════╝██║  ██║    ██╔══██╗██╔════╝██╔══██╗██║   ██║██╔════╝
██████╔╝███████║███████╗███████║    ██║  ██║█████╗  ██████╔╝██║   ██║██║  ███╗
██╔══██╗██╔══██║╚════██║██╔══██║    ██║  ██║██╔══╝  ██╔══██╗██║   ██║██║   ██║
██████╔╝██║  ██║███████║██║  ██║    ██████╔╝███████╗██████╔╝╚██████╔╝╚██████╔╝
╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝    ╚═════╝ ╚══════╝╚═════╝  ╚═════╝  ╚═════╝
```

*Debugging Bash*

[**English**](debugging-bash.md) | [Español](../../es/06-depuracion/depuracion-bash.md)

[Section index](README.md)

## Check the syntax

```bash
bash -n examples/check-disk.sh
```

`bash -n` parses the file without executing its commands. It catches missing quotes and terminators such as `fi`. It cannot check whether a path, program or piece of input exists at run time.

## Trace execution

```bash
bash -x examples/check-disk.sh / 80
```

`-x` writes expanded commands to standard error before Bash runs them. Use `set -x` and `set +x` around a small section when the full trace is too noisy. Keep secrets out of traced arguments and captured logs.

## Analyse the script

```bash
shellcheck examples/*.sh
```

ShellCheck flags issues such as missing quotes or variables that are assigned but never read. Run the script on temporary data too. Check both expected output and exit status.

[Bash invocation](https://www.gnu.org/software/bash/manual/html_node/Invoking-Bash.html) · [ShellCheck](https://www.shellcheck.net/)
