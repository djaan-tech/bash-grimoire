<!-- Monitorización del uso del disco -->
<a name="monitorización-del-uso-del-disco"></a>

```text
╔═════════════════════════════════════════════════════════════════════════════════════════════════╗
║ ██    ██ ███████  ██████      ██████  ███████ ██          ██████  ██ ███████  ██████  ██████    ║
║ ██░░  ██░██░░░░░░██ ░░░██░    ██░░░██░██░░░░░░██░░        ██░░░██░██░██░░░░░░██ ░░░░░██ ░░░██░  ║
║ ██░░  ██░███████ ██░░  ██░░   ██░░ ██░█████   ██░░        ██░░ ██░██░███████ ██░░    ██░░  ██░░ ║
║ ██░░  ██░░ ░░░██░██░░  ██░░   ██░░ ██░██░░░░░ ██░░        ██░░ ██░██░░ ░░░██░██░░    ██░░  ██░░ ║
║  ██████ ░███████░░██████ ░░   ██████ ░███████ ███████     ██████ ░██░███████░░██████  ██████ ░░ ║
║    ░░░░░░  ░░░░░░░  ░░░░░░      ░░░░░░  ░░░░░░░ ░░░░░░░     ░░░░░░  ░░ ░░░░░░░  ░░░░░░  ░░░░░░  ║
╚═════════════════════════════════════════════════════════════════════════════════════════════════╝
```

*Monitorización del uso del disco*

[English](../../en/05-automation/monitoring.md) | [**Español**](monitorizacion.md)

[Índice de la sección](README.md)

## Problema

Avisa cuando el sistema de archivos que contiene una ruta alcanza el umbral de uso configurado.

## Requisitos

Bash y [`df`](../03-comandos/sistema/df.md) de GNU. La ruta predeterminada es `/` y el umbral es `80`.

## Script completo

[Archivo fuente](../../../examples/check-disk.sh)

<details>
<summary>Ver el script</summary>

```bash
#!/usr/bin/env bash

if (( $# > 2 )); then
  printf 'Usage: %s [path] [threshold]\n' "$0" >&2
  exit 2
fi

path=${1-/}
threshold=${2-80}

# Check the decimal text before feeding it into Bash arithmetic.
if [[ ! $threshold =~ ^[0123456789]{1,3}$ ]] || (( 10#$threshold > 100 )); then
  printf 'Threshold must be an integer from 0 to 100.\n' >&2
  exit 2
fi
threshold=$(( 10#$threshold ))

if ! output=$(LC_ALL=C df --output=pcent -- "$path"); then
  printf 'Cannot determine disk usage for %s.\n' "$path" >&2
  exit 2
fi

# GNU df returns a heading followed by the percentage for this path.
row=${output#*$'\n'}
if [[ $output != *$'\n'* || ! $row =~ ^[[:blank:]]*([0123456789]{1,9})%$ ]]; then
  printf 'Unexpected disk usage for %s.\n' "$path" >&2
  exit 2
fi
usage=$(( 10#${BASH_REMATCH[1]} ))

if (( usage >= threshold )); then
  printf 'WARNING: %s is %d%% full (threshold %d%%).\n' "$path" "$usage" "$threshold" >&2
  exit 1
fi

printf 'OK: %s is %d%% full (threshold %d%%).\n' "$path" "$usage" "$threshold"
```

</details>

## Cómo funciona

`df --output=pcent` devuelve un encabezado y una fila con el uso. `LC_ALL=C` fija la configuración regional de ese comando. Bash captura la salida y usa `BASH_REMATCH[1]` para obtener los dígitos que preceden a `%`. Tras validarlos, `10#` interpreta ambos números en decimal, incluso si empiezan por cero.

## Ejecución

Desde la raíz del repositorio, indica una ruta del sistema de archivos que quieras comprobar y un porcentaje sin `%`.

```bash
bash examples/check-disk.sh / 80
```

## Ejemplo de resultado

```text
OK: / is 62% full (threshold 80%).
```

## Errores y limitaciones

`0` indica un uso inferior al umbral. `1` indica un uso igual o superior al umbral. El aviso va a la salida de error. `2` indica una entrada no válida, una consulta fallida o una salida inesperada. El script admite cifras de uso de `df` de uno a nueve dígitos, incluidos valores superiores a 100. El porcentaje corresponde a todo el sistema de archivos, aunque indiques un directorio.
