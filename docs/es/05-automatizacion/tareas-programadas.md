# Tareas programadas

[English](../../en/05-automation/scheduled-jobs.md) | [**Español**](tareas-programadas.md)

[Índice de la sección](README.md)

## Ejecutar una tarea con cron

Una tabla cron de usuario ejecuta un comando según un calendario. Prueba primero el comando a mano y abre la tabla del usuario con `crontab -e`.

```text
15 7 * * * PATH=/usr/bin:/bin /usr/bin/env bash '/home/alex/bash-scripting-handbook/examples/check-disk.sh' / 80 >> '/home/alex/disk-check.log' 2>&1
```

Los cinco campos indican minuto, hora, día del mes, mes y día de la semana. La tarea se ejecuta todos los días a las 07:15 en la zona horaria del planificador. Sustituye las rutas de ejemplo por rutas absolutas a las que tengas acceso. El intérprete de cron lee la orden y aplica las redirecciones. `env` busca Bash en el `PATH` definido para esta tarea.

Ambas salidas se añaden al mismo registro. En Cronie, un `%` sin escapar marca el fin de la orden y envía el resto a la entrada estándar, incluso entre comillas. Escribe `\%` en la tabla para pasar el signo de porcentaje literal.

## Consultar la programación de systemd

En una máquina con systemd, una unidad de temporizador puede activar una unidad de servicio. Usa esta consulta de solo lectura para ver los temporizadores que conoce el gestor del sistema.

```bash
systemctl list-timers --all
```

El ejemplo de cron requiere un servicio cron en ejecución. La consulta de temporizadores requiere un gestor de systemd accesible.

[Manual de crontab en Cronie](https://github.com/cronie-crond/cronie/blob/master/man/crontab.5) · [Manual de systemd.timer](https://www.freedesktop.org/software/systemd/man/latest/systemd.timer.html)
