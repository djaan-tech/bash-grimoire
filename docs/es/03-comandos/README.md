# Diccionario de comandos

[English](../../en/03-commands/README.md) | [**Español**](README.md)

[Inicio de la guía](../../../README.es.md)

[Por nombre](#por-orden-alfabético) · [Por tarea](#por-categorías) · [Archivos de prácticas](#archivos-de-prácticas)

Bash prepara los argumentos y las redirecciones. El programa interpreta sus opciones y procesa la entrada. En este diccionario, `kill` suele ejecutarse como comando interno de Bash.

## Por orden alfabético

[`awk`](texto/awk.md) · [`chmod`](sistema/chmod.md) · [`cp`](archivos/cp.md) · [`cut`](texto/cut.md) · [`date`](sistema/date.md) · [`df`](sistema/df.md) · [`du`](sistema/du.md) · [`find`](archivos/find.md) · [`grep`](texto/grep.md) · [`kill`](procesos/kill.md) · [`ls`](archivos/ls.md) · [`mv`](archivos/mv.md) · [`pgrep`](procesos/pgrep.md) · [`ps`](procesos/ps.md) · [`rm`](archivos/rm.md) · [`sed`](texto/sed.md) · [`sort`](texto/sort.md) · [`systemctl`](sistema/systemctl.md) · [`tar`](sistema/tar.md) · [`wc`](texto/wc.md)

## Por categorías

### Archivos y directorios

[`cp`](archivos/cp.md) copiar · [`find`](archivos/find.md) buscar · [`ls`](archivos/ls.md) listar · [`mv`](archivos/mv.md) mover · [`rm`](archivos/rm.md) borrar

### Procesamiento de texto

[`awk`](texto/awk.md) procesar registros · [`cut`](texto/cut.md) extraer columnas · [`grep`](texto/grep.md) filtrar líneas · [`sed`](texto/sed.md) sustituir texto · [`sort`](texto/sort.md) ordenar · [`wc`](texto/wc.md) contar

### Procesos

[`kill`](procesos/kill.md) enviar señales · [`pgrep`](procesos/pgrep.md) buscar PID · [`ps`](procesos/ps.md) consultar procesos

### Administración del sistema

[`chmod`](sistema/chmod.md) cambiar permisos · [`date`](sistema/date.md) formatear fechas · [`df`](sistema/df.md) consultar espacio libre · [`du`](sistema/du.md) medir archivos · [`systemctl`](sistema/systemctl.md) consultar servicios · [`tar`](sistema/tar.md) empaquetar archivos

## Archivos de prácticas

Ejecuta este bloque en otro terminal de Bash. Entrarás en un directorio temporal nuevo, separado de tus archivos.

```bash
work=$(mktemp -d) || exit
cd "$work" || exit
mkdir -- "sample data"
printf '%s\n%s' '  first\record  ' 'last record' > 'sample data/notes file.txt'
printf '%s\n' 'quarterly report' > report.txt
printf '%s\n' 'ready to rename' > old.txt
printf '%s\n' '#!/usr/bin/env bash' 'printf "%s\n" ready' > job.sh
printf '%s\n' 'INFO started' 'ERROR timeout' 'ERROR retry' > app.log
printf '%s\n' 'root:95' 'data:41' > usage.txt
```
