<!-- Scripts de ejemplo -->
<a name="scripts-de-ejemplo"></a>

```text
╔═══════════════════════════════════════════════════════════════════════════╗
║ ███████  ██████ ██████  ██ ██████  ████████ ███████     ██████  ███████   ║
║ ██░░░░░░██ ░░░░░██░░░██░██░██░░░██░  ░██░░░░██░░░░░░░   ██░░░██░██░░░░░░░ ║
║ ███████ ██░░    ██████ ░██░██████ ░░  ██░░  ███████     ██░░ ██░█████     ║
║   ░░░██░██░░    ██░░░██░██░██░░░░░░   ██░░    ░░░██░░   ██░░ ██░██░░░░░   ║
║ ███████░░██████ ██░░ ██░██░██░░       ██░░  ███████░░   ██████ ░███████   ║
║   ░░░░░░░  ░░░░░░ ░░   ░░ ░░ ░░         ░░    ░░░░░░░     ░░░░░░  ░░░░░░░ ║
║                                                                           ║
║ ███████      ██ ███████ ███    ███ ██████  ██       ██████                ║
║ ██░░░░░░░    ██░██░░░░░░████░ ████░██░░░██░██░░    ██ ░░░██░              ║
║ █████        ██░█████   ██░████ ██░██████ ░██░░    ██░░  ██░░             ║
║ ██░░░░░ ██   ██░██░░░░░ ██░░██░░██░██░░░░░░██░░    ██░░  ██░░             ║
║ ███████  █████ ░███████ ██░░  ░░██░██░░    ███████  ██████ ░░             ║
║   ░░░░░░░  ░░░░░  ░░░░░░░ ░░      ░░ ░░      ░░░░░░░  ░░░░░░              ║
╚═══════════════════════════════════════════════════════════════════════════╝
```

[English](README.md) | [**Español**](README.es.md)

[Inicio de la guía](../README.es.md)

Ejecuta los scripts desde la raíz del repositorio. Los casos enlazados indican las dependencias e incluyen ejemplos completos que puedes probar con datos temporales.

- [Monitorización del uso del disco](../docs/es/05-automatizacion/monitorizacion.md). `bash examples/check-disk.sh / 80`. [Código fuente](check-disk.sh)
- [Copia de seguridad de un directorio](../docs/es/05-automatizacion/copias-de-seguridad.md). `bash examples/backup.sh SOURCE DESTINATION`. [Código fuente](backup.sh)
- [Análisis de registros](../docs/es/05-automatizacion/analisis-de-registros.md). `bash examples/analyze-logs.sh LOG_FILE`. [Código fuente](analyze-logs.sh)

## Comprobar la sintaxis

```bash
for script in examples/*.sh; do
  bash -n "$script" || exit 1
done
```

Si tienes ShellCheck, ejecuta también `shellcheck examples/*.sh`. Los mensajes de los scripts compartidos están en inglés.
