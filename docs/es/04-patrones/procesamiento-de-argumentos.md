<!-- Procesamiento de argumentos -->
<a name="procesamiento-de-argumentos"></a>

```text
╔════════════════════════════════════════════════════════════════════════════════════════════════════╗
║ ██████ ██████  ██████  ████████████████████ █████ ███    ███████████████    ████████████████       ║
║ ██░░░████░░░████ ░░░████ ░░░░██░░░░░██░░░░░██ ░░██████░ ████████░░░░░████░  ██░░░██░░██░░░░██░     ║
║ ██████ ██████ ██░░  ████░░   █████  ████████████████░████ █████████  ██░██░ ██░░ ██░░██░░  ██░░    ║
║ ██░░░░░██░░░████░░  ████░░   ██░░░░░  ░░░████░░░████░░██░░██████░░░░░██░░██░██░░ ██░░██░░  ██░░    ║
║ ██░░   ██░░ ██░██████ ░██████████████████████░░ ████░░  ░░█████████████░░ ████░░ ██░░ ██████ ░░    ║
║   ░░     ░░   ░░ ░░░░░░  ░░░░░░░░░░░░░░░░░░░░░░   ░░░░      ░░░░░░░░░░░░░   ░░░░   ░░   ░░░░░░     ║
║                                                                                                    ║
║ ██████ ███████     █████ ██████  ██████ ██    █████    █████████████    ████████████████ ███████   ║
║ ██░░░████░░░░░░░  ██ ░░████░░░████ ░░░░░██░░  ██████░ ██████░░░░░████░  ██░░░██░░██░░░░████░░░░░░░ ║
║ ██░░ ███████      █████████████ ██░░ █████░░  ████░████ ███████  ██░██░ ██░░ ██░░██░░  █████████   ║
║ ██░░ ████░░░░░    ██░░░████░░░████░░  ████░░  ████░░██░░████░░░░░██░░██░██░░ ██░░██░░  ██░░░░░██░░ ║
║ ██████ ███████    ██░░ ████░░ ██░██████ ░██████ ██░░  ░░███████████░░ ████░░ ██░░ ██████ ███████░░ ║
║   ░░░░░░ ░░░░░░░    ░░   ░░░░   ░░ ░░░░░░  ░░░░░░ ░░      ░░░░░░░░░░░   ░░░░   ░░   ░░░░░░ ░░░░░░░ ║
╚════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

[English](../../en/04-patterns/parsing-arguments.md) | [**Español**](procesamiento-de-argumentos.md)

[Índice de la sección](README.md)

## Comprobar el número de argumentos

**Problema:** Exige un solo operando antes de leerlo.

**Solución**
```bash
if (( $# != 1 )); then
  printf 'Usage: %s FILE\n' "$0" >&2
  exit 2
fi
file=$1
```

**Por qué funciona:** `$#` cuenta los argumentos. El script indica un error de uso antes de expandir un `$1` ausente.

**Cuándo aplicarlo:** Valida las invocaciones de scripts con un número fijo de operandos.

## Procesar opciones cortas con getopts

**Problema:** Lee `-f FORMATO` antes de los operandos posicionales opcionales. Guarda el bloque como `parse.sh` y prueba `bash parse.sh -f json -- 'report file.txt'`.

**Solución**
```bash
format=text
while getopts ':f:' option; do
  case $option in
    f) format=$OPTARG ;;
    :) printf 'Option -%s needs a value.\n' "$OPTARG" >&2; exit 2 ;;
    \?) printf 'Unknown option -%s.\n' "$OPTARG" >&2; exit 2 ;;
  esac
done
shift "$(( OPTIND - 1 ))"
printf 'Format: %s. Operands: %s\n' "$format" "$#"
```

**Por qué funciona:** En `:f:`, el signo de dos puntos inicial permite gestionar los errores de forma personalizada. Los dos puntos después de `f` marcan un valor obligatorio. Bash escribe ese valor en `OPTARG`. Tras el bucle, `OPTIND` marca el primer argumento pendiente.

**Cuándo aplicarlo:** Procesa un conjunto pequeño de opciones cortas. Pon las opciones antes de los operandos y usa `--` para cerrar la lista de opciones. Si vuelves a procesar opciones en el mismo intérprete, restablece `OPTIND=1`.

## Reutilizar una función para diagnósticos

**Problema:** Da un formato común a diagnósticos repetidos.

**Solución**
```bash
warn() {
  printf 'Warning: %s\n' "$1" >&2
}
[[ -r ./report.txt ]] || warn 'report.txt is unavailable.'
```

**Por qué funciona:** La función recibe una sola cadena y la envía a la salida de error con un formato fijo de `printf`.

**Cuándo aplicarlo:** Comparte el estilo de los mensajes entre la validación y la ejecución. Usa `return` o `exit` donde invoques la función si un fallo debe detener el trabajo.
