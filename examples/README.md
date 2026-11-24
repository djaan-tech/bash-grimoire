<!-- Example scripts -->
<a name="example-scripts"></a>

```text
███████╗██╗  ██╗ █████╗ ███╗   ███╗██████╗ ██╗     ███████╗███████╗
██╔════╝╚██╗██╔╝██╔══██╗████╗ ████║██╔══██╗██║     ██╔════╝██╔════╝
█████╗   ╚███╔╝ ███████║██╔████╔██║██████╔╝██║     █████╗  ███████╗
██╔══╝   ██╔██╗ ██╔══██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝  ╚════██║
███████╗██╔╝ ██╗██║  ██║██║ ╚═╝ ██║██║     ███████╗███████╗███████║
╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝╚══════╝
```

*Example scripts*

[**English**](README.md) | [Español](README.es.md)

[Handbook home](../README.md)

Run the scripts from the repository root. The linked cases list their dependencies and include complete examples you can try with temporary data.

- [Disk usage monitoring](../docs/en/05-automation/monitoring.md). `bash examples/check-disk.sh / 80`. [Source](check-disk.sh)
- [Directory backup](../docs/en/05-automation/backups.md). `bash examples/backup.sh SOURCE DESTINATION`. [Source](backup.sh)
- [Log analysis](../docs/en/05-automation/log-analysis.md). `bash examples/analyze-logs.sh LOG_FILE`. [Source](analyze-logs.sh)

## Check the syntax

```bash
for script in examples/*.sh; do
  bash -n "$script" || exit 1
done
```

If ShellCheck is installed, also run `shellcheck examples/*.sh`. The shared scripts print their messages in English.
