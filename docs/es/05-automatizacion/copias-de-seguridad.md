<!-- Copias de seguridad de directorios -->
<a name="copias-de-seguridad-de-directorios"></a>

```text
╔════════════════════════════════════════════════════════════════════════╗
║  ██████  ██████  ██████  ██  █████  ███████     ██████  ███████        ║
║ ██ ░░░░░██ ░░░██░██░░░██░██░██ ░░██░██░░░░░░░   ██░░░██░██░░░░░░░      ║
║ ██░░    ██░░  ██░██████ ░██░███████░███████     ██░░ ██░█████          ║
║ ██░░    ██░░  ██░██░░░░░░██░██░░░██░░ ░░░██░░   ██░░ ██░██░░░░░        ║
║  ██████  ██████ ░██░░    ██░██░░ ██░███████░░   ██████ ░███████        ║
║    ░░░░░░  ░░░░░░  ░░      ░░ ░░   ░░ ░░░░░░░     ░░░░░░  ░░░░░░░      ║
║                                                                        ║
║ ███████ ███████  ██████  ██    ██ ██████  ██ ██████   █████  ██████    ║
║ ██░░░░░░██░░░░░░██ ░░░░░░██░░  ██░██░░░██░██░██░░░██░██ ░░██░██░░░██░  ║
║ ███████ █████   ██░░ ███ ██░░  ██░██████ ░██░██░░ ██░███████░██░░ ██░░ ║
║   ░░░██░██░░░░░ ██░░  ██░██░░  ██░██░░░██░██░██░░ ██░██░░░██░██░░ ██░░ ║
║ ███████░███████  ██████ ░░██████ ░██░░ ██░██░██████ ░██░░ ██░██████ ░░ ║
║   ░░░░░░░ ░░░░░░░  ░░░░░░   ░░░░░░  ░░   ░░ ░░ ░░░░░░  ░░   ░░ ░░░░░░  ║
╚════════════════════════════════════════════════════════════════════════╝
```

*Copias de seguridad de directorios*

[English](../../en/05-automation/backups.md) | [**Español**](copias-de-seguridad.md)

[Índice de la sección](README.md)

## Problema

Crea una copia fechada y comprimida de un directorio y conserva las copias que ya existen.

## Requisitos

Bash, [`tar`](../03-comandos/sistema/tar.md) de GNU, gzip, GNU Coreutils (`realpath`, `mkdir`, `date`, `mktemp`, `ln`, `rm`) y un destino en un sistema de archivos que admita enlaces duros.

## Script completo

[Archivo fuente](../../../examples/backup.sh)

<details>
<summary>Ver el script</summary>

```bash
#!/usr/bin/env bash

if (( $# != 2 )); then
  printf 'Usage: %s SOURCE DESTINATION\n' "$0" >&2
  exit 2
fi

if [[ ! -d $1 || -z $2 ]]; then
  printf 'Provide an existing source directory and a destination path.\n' >&2
  exit 2
fi

# Resolve symbolic links and keep any newlines in directory names.
if ! IFS= read -r -d '' source < <(realpath -ez -- "$1") ||
   ! IFS= read -r -d '' destination < <(realpath -mz -- "$2"); then
  printf 'Cannot resolve the source or destination.\n' >&2
  exit 2
fi

if [[ $source == / || $destination == "$source" || $destination == "$source/"* ]]; then
  printf 'The destination must be outside the source directory.\n' >&2
  exit 2
fi

if ! mkdir -p -- "$destination"; then
  exit 2
fi

if ! timestamp=$(date -u +%Y%m%dT%H%M%SZ) ||
   ! temporary=$(mktemp -- "$destination/.backup.XXXXXXXX"); then
  exit 2
fi

# Clean up the temporary file on success, failure or a handled signal.
trap 'rm -f -- "$temporary"' EXIT
trap 'exit 2' HUP INT TERM

parent=${source%/*}
name=${source##*/}
archive="$destination/backup-$timestamp.tar.gz"

# Use only the options listed here, even if TAR_OPTIONS is set in the caller.
if ! TAR_OPTIONS='' tar -czf "$temporary" -C "${parent:-/}" -- "$name"; then
  printf 'Backup failed for %s.\n' "$source" >&2
  exit 2
fi

# Publish the complete archive without replacing an existing file.
if ! ln -T -- "$temporary" "$archive"; then
  printf 'Cannot publish the archive at %s.\n' "$archive" >&2
  exit 2
fi

printf 'Backup created: %s\n' "$archive"
```

</details>

## Cómo funciona

`realpath` resuelve los enlaces simbólicos antes de comprobar si el destino queda fuera del origen. Con `-z`, las rutas terminan en NUL, así que `read -d ''` de Bash puede leer nombres con saltos de línea.

`tar -czf` crea una copia comprimida con gzip en un archivo temporal. `-C` permite guardar rutas relativas al directorio padre del origen. Al vaciar `TAR_OPTIONS` para ese comando, las opciones heredadas no intervienen.

Tras completar `tar`, `ln -T` da al mismo archivo un segundo nombre con fecha y falla si ese nombre ya existe. El manejador de salida borra el nombre temporal.

## Ejecución

Desde la raíz del repositorio, prepara un origen temporal y haz una copia.

```bash
(
  work=$(mktemp -d) || exit 1
  mkdir -- "$work/project files" || exit 1
  printf '%s\n' 'weekly notes' > "$work/project files/notes.txt"
  bash examples/backup.sh "$work/project files" "$work/backups"
)
```

## Ejemplo de resultado

```text
Backup created: /tmp/tmp.X7qV0Lr1fd/backups/backup-20261123T073000Z.tar.gz
```

## Errores y limitaciones

`0` indica que se ha creado la copia. `2` abarca rutas no válidas, fallos de compresión o un nombre de destino que ya existe. Dos ejecuciones con el mismo destino durante el mismo segundo UTC pueden generar el mismo nombre. Usa rutas de confianza.

Los archivos pueden cambiar durante la copia. La rotación de copias y las instantáneas coherentes requieren herramientas adicionales. Antes de confiar en una copia, lista el contenido con `tar -tzf` y prueba a restaurarla en un directorio vacío.
