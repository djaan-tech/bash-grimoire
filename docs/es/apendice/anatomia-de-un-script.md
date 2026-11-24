# Anatomía de un script Bash

[English](../../en/appendix/script-anatomy.md) | [**Español**](anatomia-de-un-script.md)

[Apéndice](README.md) · [Hoja de referencia](../../../CHEATSHEET.es.md)

## Las piezas esenciales

| Pieza | Qué significa en la práctica |
| --- | --- |
| Línea del intérprete (`#!`) | Indica qué intérprete usar al ejecutar el archivo directamente. `#!/usr/bin/env bash` hace que `env` busque Bash en `PATH`. |
| Comentario | Un `#` sin comillas al inicio de una palabra convierte el resto de la línea en un comentario. |
| Argumento | Valor que recibe un comando o una función. En `bash describe.sh 'daily report.txt'`, el script recibe `daily report.txt` como un solo argumento. |
| Opción | Argumento que modifica el comportamiento de un comando. En `bash -n describe.sh`, `-n` pide a Bash que compruebe la sintaxis. |
| Parámetro | Elemento de Bash que guarda un valor y se identifica por nombre, posición o símbolo. `$1` expande el primero de los parámetros posicionales y `$#` da el número de argumentos. |
| Variable | Parámetro con nombre en el que puedes guardar un valor. `local name="$1"` lo guarda en una variable local y `"$name"` lo recupera como un solo argumento. |
| Función | Bloque con nombre que puedes invocar como un comando. Durante la llamada, recibe sus propios parámetros posicionales. |
| Condicional y bucle | `if` decide qué ejecutar a partir de un código de salida. `for` y `while` repiten operaciones. |
| Redirección y tubería | `>&2` dirige la salida estándar de un comando a su salida de error. Una tubería conecta la salida estándar de un comando con la entrada estándar de otro. |
| Código de salida | Resultado numérico. Por convenio, `0` indica éxito. `return` termina una función y `exit` termina el intérprete que ejecuta el script. |

## Un ejemplo de principio a fin

Guarda el bloque en un archivo nuevo llamado `describe.sh`. El script comprueba cuántos argumentos recibe e imprime el nombre que se le pasa.

```bash
#!/usr/bin/env bash

describe() {
  local name="$1"
  printf 'File: %s\n' "$name"
}

if (( $# != 1 )); then
  printf 'Usage: %s FILE\n' "$0" >&2
  exit 2
fi

describe "$1"
```

```bash
bash describe.sh 'daily report.txt'
```

1. Las comillas hacen que el intérprete que lanza Bash pase el nombre con espacios como un solo argumento. Bash lo asigna al parámetro que se expande con `$1`.
2. `describe "$1"` lee ese valor y lo pasa a la función, donde vuelve a estar disponible como su propio `$1`.
3. Si `printf` imprime `File: daily report.txt` correctamente, la función y el script terminan con código `0`. Si el número de argumentos es incorrecto, el script escribe el mensaje de uso en la salida de error y devuelve `2`. En ese mensaje, `$0` da el nombre con el que se invocó el script.

[Parámetros y argumentos](../02-sintaxis/argumentos.md) · [Funciones](../02-sintaxis/funciones.md) · [Entrada, salida y códigos](../01-fundamentos/entrada-salida-y-codigos.md)
