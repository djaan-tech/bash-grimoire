<!-- Scheduled jobs -->
<a name="scheduled-jobs"></a>

```text
╔════════════════════════════════════════════════════════════════════════════╗
║ ███████  ██████ ██   ██ ███████ ██████  ██    ██ ██      ███████ ██████    ║
║ ██░░░░░░██ ░░░░░██░░ ██░██░░░░░░██░░░██░██░░  ██░██░░    ██░░░░░░██░░░██░  ║
║ ███████ ██░░    ███████░█████   ██░░ ██░██░░  ██░██░░    █████   ██░░ ██░░ ║
║   ░░░██░██░░    ██░░░██░██░░░░░ ██░░ ██░██░░  ██░██░░    ██░░░░░ ██░░ ██░░ ║
║ ███████░░██████ ██░░ ██░███████ ██████ ░░██████ ░███████ ███████ ██████ ░░ ║
║   ░░░░░░░  ░░░░░░ ░░   ░░ ░░░░░░░ ░░░░░░   ░░░░░░  ░░░░░░░ ░░░░░░░ ░░░░░░  ║
║                                                                            ║
║      ██  ██████  ██████  ███████                                           ║
║      ██░██ ░░░██░██░░░██░██░░░░░░░                                         ║
║      ██░██░░  ██░██████ ░███████                                           ║
║ ██   ██░██░░  ██░██░░░██░  ░░░██░░                                         ║
║  █████ ░░██████ ░██████ ░███████░░                                         ║
║    ░░░░░   ░░░░░░  ░░░░░░  ░░░░░░░                                         ║
╚════════════════════════════════════════════════════════════════════════════╝
```

[**English**](scheduled-jobs.md) | [Español](../../es/05-automatizacion/tareas-programadas.md)

[Section index](README.md)

## Run a job with cron

A user crontab runs a command on a calendar schedule. Run the command manually first, then open the user crontab with `crontab -e`.

```text
15 7 * * * PATH=/usr/bin:/bin /usr/bin/env bash '/home/alex/bash-scripting-handbook/examples/check-disk.sh' / 80 >> '/home/alex/disk-check.log' 2>&1
```

The five fields mean minute, hour, day of the month, month and day of the week. This runs every day at 07:15 in the scheduler’s time zone. Replace the sample paths with absolute paths you can access. The cron shell parses the command and redirects its output. `env` finds Bash using the `PATH` set for this job.

Both output streams append to the same log. In Cronie, an unescaped `%` ends the command and sends the rest to standard input, even inside shell quotes. Write `\%` in the crontab for a literal percent sign.

## Inspect systemd schedules

On a machine with systemd, a timer unit can activate a service unit. Use this read-only query to inspect timers known to the system manager.

```bash
systemctl list-timers --all
```

The cron example requires a running cron service. The timer query requires a reachable systemd manager.

[Cronie crontab manual](https://github.com/cronie-crond/cronie/blob/master/man/crontab.5) · [systemd.timer manual](https://www.freedesktop.org/software/systemd/man/latest/systemd.timer.html)
