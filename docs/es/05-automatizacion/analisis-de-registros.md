<!-- Análisis de registros -->
<a name="análisis-de-registros"></a>

```text
██████╗ ███████╗ ██████╗ ██╗███████╗████████╗██████╗  ██████╗ ███████╗
██╔══██╗██╔════╝██╔════╝ ██║██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗██╔════╝
██████╔╝█████╗  ██║  ███╗██║███████╗   ██║   ██████╔╝██║   ██║███████╗
██╔══██╗██╔══╝  ██║   ██║██║╚════██║   ██║   ██╔══██╗██║   ██║╚════██║
██║  ██║███████╗╚██████╔╝██║███████║   ██║   ██║  ██║╚██████╔╝███████║
╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝
```

*Análisis de registros*

[English](../../en/05-automation/log-analysis.md) | [**Español**](analisis-de-registros.md)

[Índice de la sección](README.md)

## Problema

Cuenta las líneas del registro que contienen el texto literal `ERROR` y muestra un resumen breve.

## Requisitos

Bash, [`grep`](../03-comandos/texto/grep.md) de GNU y un archivo regular que se pueda leer.

## Script completo

[Archivo fuente](../../../examples/analyze-logs.sh)

<details>
<summary>Ver el script</summary>

```bash
#!/usr/bin/env bash

if (( $# != 1 )); then
  printf 'Usage: %s LOG_FILE\n' "$0" >&2
  exit 2
fi

log=$1
if [[ ! -f $log || ! -r $log ]]; then
  printf 'Cannot read a regular log file at %s.\n' "$log" >&2
  exit 2
fi

# Count matching lines once, even if ERROR appears twice on the same line.
if count=$(LC_ALL=C grep -aFc -e 'ERROR' < "$log"); then
  :
else
  status=$?
  # A redirection error can also return 1, but leaves the count empty.
  if (( status != 1 )) || [[ $count != 0 ]]; then
    printf 'Could not analyse %s (search status %d).\n' "$log" "$status" >&2
    exit 2
  fi
fi

printf '%s: %s line(s) containing ERROR\n' "$log" "$count"
```

</details>

## Cómo funciona

El script comprueba el tipo de archivo y el permiso de lectura. Bash abre la ruta como entrada estándar. `grep` usa `-a` para tratar la entrada como texto, `-F` para buscar texto fijo, `-c` para contar las líneas que coinciden y `-e` para indicar el patrón. El script acepta el código `1` acompañado de una salida `0` como resultado vacío. Si Bash no puede abrir el archivo para redirigirlo, también puede devolver `1`, esta vez sin recuento.

## Ejecución

Desde la raíz del repositorio, crea un registro de ejemplo en un directorio temporal y pasa su ruta al script.

```bash
(
  work=$(mktemp -d) || exit 1
  printf '%s\n' 'INFO started' 'ERROR timeout' 'ERROR retry' > "$work/app log.txt"
  bash examples/analyze-logs.sh "$work/app log.txt"
)
```

## Ejemplo de resultado

```text
/tmp/tmp.X7qV0Lr1fd/app log.txt: 2 line(s) containing ERROR
```

## Errores y limitaciones

`0` indica un recuento válido, incluido cero. `2` indica un error de uso o de búsqueda. La búsqueda distingue mayúsculas de minúsculas e incluye cualquier línea que contenga la subcadena, por ejemplo `SOME_ERROR`. Una línea con dos apariciones cuenta una vez. La búsqueda lee todo el archivo y no descomprime registros rotados.
