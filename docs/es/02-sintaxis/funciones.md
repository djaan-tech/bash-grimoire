<!-- Funciones -->
<a name="funciones"></a>

```text
███████╗██╗   ██╗███╗   ██╗ ██████╗██╗ ██████╗ ███╗   ██╗███████╗███████╗
██╔════╝██║   ██║████╗  ██║██╔════╝██║██╔═══██╗████╗  ██║██╔════╝██╔════╝
█████╗  ██║   ██║██╔██╗ ██║██║     ██║██║   ██║██╔██╗ ██║█████╗  ███████╗
██╔══╝  ██║   ██║██║╚██╗██║██║     ██║██║   ██║██║╚██╗██║██╔══╝  ╚════██║
██║     ╚██████╔╝██║ ╚████║╚██████╗██║╚██████╔╝██║ ╚████║███████╗███████║
╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝
```

[English](../../en/02-syntax/functions.md) | [**Español**](funciones.md)

[Índice de la sección](README.md)

## Definir e invocar funciones

**Qué es:** Una función agrupa comandos bajo un nombre en el intérprete.

**Sintaxis**
```bash
name() {
  command
}
name argument
```

**Ejemplo**
```bash
report_path() {
  local path=$1
  printf 'Path: %s\n' "$path"
}
report_path 'annual report.txt'
```

**Cómo funciona:** Al invocarla directamente, Bash la ejecuta en el intérprete actual y sustituye los parámetros posicionales durante la llamada. `local` limita el ámbito de `path` a la función.

**Cuándo usarlo:** Reutiliza una tarea pequeña, centraliza un diagnóstico o separa el flujo principal de los detalles.

**Importante:** Valida el número de argumentos antes de leer `$1` en una función que se invoque desde otros scripts. Usa `name() { ...; }` para la forma de declaración compatible con POSIX.

## Devolver un código y emitir datos

**Qué es:** Una función comunica su código mediante `return` o mediante el último comando.
Puede escribir datos en la salida estándar.

**Sintaxis**
```bash
return status
value=$(function_name argument)
```

**Ejemplo**
```bash
report_label() {
  [[ $# -eq 1 ]] || return 2
  printf 'report-%s\n' "$1"
}
if label=$(report_label weekly); then
  printf '%s\n' "$label"
fi
```

**Cómo funciona:** Una invocación directa deja el código de la función en `$?`. Con `$(...)`, Bash captura la salida estándar en un subintérprete. Una asignación sin comando toma el código de su última sustitución de comandos.

**Cuándo usarlo:** Comunica éxito o fallo a quien invoca la función y, si procede, produce datos que pueda capturar.

**Importante:** Envía los diagnósticos a la salida de error para que no se mezclen con los datos. Los cambios de estado en un subintérprete no llegan al intérprete que lo invoca.

[Funciones de Bash](https://www.gnu.org/software/bash/manual/html_node/Shell-Functions.html)
