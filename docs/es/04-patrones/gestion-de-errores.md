<!-- Gestión de errores -->
<a name="gestión-de-errores"></a>

```text
╔═══════════════════════════════════════════════════════════════════════════════╗
║                                         ´                                     ║
║  ██████  ███████ ███████ ████████ ██  ██████  ███    ██     ██████  ███████   ║
║ ██ ░░░░░░██░░░░░░██░░░░░░░ ░██░░░░██░██ ░░░██░████░  ██░░   ██░░░██░██░░░░░░░ ║
║ ██░░ ███ █████   ███████    ██░░  ██░██░░  ██░██░██░ ██░░   ██░░ ██░█████     ║
║ ██░░  ██░██░░░░░   ░░░██░░  ██░░  ██░██░░  ██░██░░██░██░░   ██░░ ██░██░░░░░   ║
║  ██████ ░███████ ███████░░  ██░░  ██░░██████ ░██░░ ████░░   ██████ ░███████   ║
║    ░░░░░░  ░░░░░░░ ░░░░░░░    ░░    ░░  ░░░░░░  ░░   ░░░░     ░░░░░░  ░░░░░░░ ║
║                                                                               ║
║ ███████ ██████  ██████   ██████  ██████  ███████ ███████                      ║
║ ██░░░░░░██░░░██░██░░░██░██ ░░░██░██░░░██░██░░░░░░██░░░░░░░                    ║
║ █████   ██████ ░██████ ░██░░  ██░██████ ░█████   ███████                      ║
║ ██░░░░░ ██░░░██░██░░░██░██░░  ██░██░░░██░██░░░░░   ░░░██░░                    ║
║ ███████ ██░░ ██░██░░ ██░░██████ ░██░░ ██░███████ ███████░░                    ║
║   ░░░░░░░ ░░   ░░ ░░   ░░  ░░░░░░  ░░   ░░ ░░░░░░░ ░░░░░░░                    ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

[English](../../en/04-patterns/handling-errors.md) | [**Español**](gestion-de-errores.md)

[Índice de la sección](README.md)

## Capturar la salida y comprobar su código

**Problema:** Usa la salida de un comando solo si este termina correctamente.

**Solución**
```bash
if stamp=$(date -u +%Y-%m-%d); then
  printf '%s\n' "$stamp"
else
  status=$?
  printf 'date failed (%s)\n' "$status" >&2
  exit "$status"
fi
```

**Por qué funciona:** Una asignación sin comando adopta el código de su sustitución. Dentro de `else`, `$?` todavía contiene ese código.

**Cuándo aplicarlo:** Captura una fecha, un recuento o una ruta. Guarda `$?` de inmediato si vas a usarlo después.

## Tratar un código distinto de cero previsto

**Problema:** Distingue una búsqueda sin coincidencias de una búsqueda fallida. Pruébalo con el [registro de prácticas](../03-comandos/README.md#archivos-de-prácticas).

**Solución**
```bash
file=./app.log
if grep -F -e 'ERROR' -- "$file"; then
  :
else
  status=$?
  case $status in
    1) printf '%s\n' 'No matches.' ;;
    *) printf 'Search failed (%s)\n' "$status" >&2; exit "$status" ;;
  esac
fi
```

**Por qué funciona:** `-F` busca texto fijo, `-e` proporciona el patrón y `--` marca el fin de las opciones. GNU `grep` abre el archivo y devuelve 1 si no hay coincidencias o 2 si hay un error. El comando interno `:` de Bash devuelve cero sin hacer nada.

**Cuándo aplicarlo:** Usa `if` sin `!` para conservar el código original. Una redirección fallida de Bash también puede devolver 1 antes de ejecutar `grep`. Pasa el nombre como argumento para que `grep` indique los errores de apertura.

## set -e

**Qué es:** `set -e` pide a Bash que termine si falla un comando o una tubería cuyo error no se trata, en determinados contextos.

**Sintaxis**
```bash
set -e
set +e
```

**Ejemplo**
```bash
bash -c 'set -e; false; printf "%s\n" unreachable'
bash -c 'set -e; if false; then :; fi; printf "%s\n" survived'
```

**Cómo funciona:** Los fallos en condiciones de `if`, `while` y `until`, bajo `!` y antes del último comando de una lista `&&` o `||` conservan su código sin que Bash termine. Con `pipefail`, un fallo en una fase anterior puede determinar el código de salida de la tubería. La excepción puede extenderse al cuerpo de una función invocada en una condición.

**Cuándo usarlo:** Úsalo como protección adicional en un script con fallos bien definidos. Trata de forma explícita los fallos previstos.

**Importante:** Bash suele desactivar `-e` dentro de `$(...)`. El modo POSIX o la opción `inherit_errexit` de Bash conservan ese ajuste. El primer ejemplo termina con código 1.

## set -u

**Qué es:** `set -u` trata como error la mayoría de las expansiones de parámetros sin definir.

**Sintaxis**
```bash
set -u
set +u
```

**Ejemplo**
```bash
bash -c 'set -u; unset mode; printf "%s\n" "${mode:-brief}"'
```

**Cómo funciona:** Bash indica que la expansión no es válida y termina si no es interactivo. Expansiones como `${mode:-brief}` prevén una variable sin definir o vacía.

**Cuándo usarlo:** Detecta nombres de variables mal escritos y define valores predeterminados para las entradas opcionales.

**Importante:** `"$@"` y `"$*"` son excepciones. `set -u` admite un valor vacío que se haya asignado.

## pipefail

**Qué es:** `pipefail` cambia el código de salida que Bash asigna a una tubería.

**Sintaxis**
```bash
set -o pipefail
set +o pipefail
```

**Ejemplo**
```bash
bash -c 'set -o pipefail; false | true; printf "%s\n" "$?"'
```

**Cómo funciona:** Si está activado, Bash usa el código de la fase fallida situada más a la derecha, o cero si todas terminan correctamente. El ejemplo imprime `1`.

**Cuándo usarlo:** Detecta que un productor ha fallado aunque el consumidor termine correctamente.

**Importante:** Un consumidor que sale antes de tiempo, como `grep -q` al hallar una coincidencia, puede provocar que el productor termine por `SIGPIPE`. Para identificar cada fase, copia de inmediato el array `PIPESTATUS` de Bash.

[Opciones del comando interno set](https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html)
