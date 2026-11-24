# systemctl — Inspect and control systemd units

[**English**](systemctl.md) | [Español](../../../es/03-comandos/sistema/systemctl.md)

[Command dictionary](../README.md)

**What does it do?**

Queries or controls units managed by systemd, such as services and timers.

**Basic syntax**
```bash
systemctl [options] subcommand [unit ...]
```

**Practical example**
```bash
systemctl is-active systemd-journald.service
```

`is-active` queries the runtime state of the named unit. The example reports a state such as `active` or `inactive`.

**What happens internally?**

`systemctl` queries the systemd manager for the unit’s active state. It prints the state and returns zero if at least one of the requested units is active.

**When should I use it?**

Check a service from a script or inspect the state of a scheduled unit.

**What should I remember?**

A reachable systemd manager is required. A nonzero result may indicate an inactive unit or a query failure. Commands that alter units can require authorisation.

[Upstream reference](https://www.freedesktop.org/software/systemd/man/latest/systemctl.html)
