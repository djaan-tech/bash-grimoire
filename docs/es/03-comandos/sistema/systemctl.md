<!-- systemctl — Consultar y controlar unidades de systemd -->
<a name="systemctl--consultar-y-controlar-unidades-de-systemd"></a>

```text
╔═════════════════════════════════════════════════════════════════════════════════╗
║ ███████ ██    ██ ███████ ████████ ███████ ███    ███  ██████ ████████ ██        ║
║ ██░░░░░░░██░ ██ ░██░░░░░░░ ░██░░░░██░░░░░░████░ ████░██ ░░░░░░ ░██░░░░██░░      ║
║ ███████   ████ ░░███████    ██░░  █████   ██░████ ██░██░░       ██░░  ██░░      ║
║   ░░░██░░  ██░░░   ░░░██░░  ██░░  ██░░░░░ ██░░██░░██░██░░       ██░░  ██░░      ║
║ ███████░░  ██░░  ███████░░  ██░░  ███████ ██░░  ░░██░░██████    ██░░  ███████   ║
║   ░░░░░░░    ░░    ░░░░░░░    ░░    ░░░░░░░ ░░      ░░  ░░░░░░    ░░    ░░░░░░░ ║
╚═════════════════════════════════════════════════════════════════════════════════╝
```

*Consultar y controlar unidades de systemd*

[English](../../../en/03-commands/system/systemctl.md) | [**Español**](systemctl.md)

[Diccionario de comandos](../README.md)

**¿Qué hace?**

Consulta o controla unidades gestionadas por systemd, como servicios y temporizadores.

**Sintaxis básica**
```bash
systemctl [options] subcommand [unit ...]
```

**Ejemplo práctico**
```bash
systemctl is-active systemd-journald.service
```

`is-active` consulta el estado de la unidad indicada. El ejemplo muestra un estado como `active` o `inactive`.

**¿Qué sucede internamente?**

`systemctl` pregunta al gestor de systemd por el estado de actividad de la unidad. Imprime el estado y devuelve cero si al menos una de las unidades indicadas está activa.

**¿Cuándo utilizarlo?**

Comprueba un servicio desde un script o consulta el estado de una unidad programada.

**¿Qué debo recordar?**

Hace falta un gestor de systemd accesible. Un código distinto de cero puede indicar una unidad inactiva o un fallo en la consulta. Los comandos que modifican unidades pueden requerir autorización.

[Documentación oficial](https://www.freedesktop.org/software/systemd/man/latest/systemctl.html)
