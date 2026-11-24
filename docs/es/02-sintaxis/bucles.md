<!-- Bucles -->
<a name="bucles"></a>

```text
██████╗ ██╗   ██╗ ██████╗██╗     ███████╗███████╗
██╔══██╗██║   ██║██╔════╝██║     ██╔════╝██╔════╝
██████╔╝██║   ██║██║     ██║     █████╗  ███████╗
██╔══██╗██║   ██║██║     ██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝╚██████╗███████╗███████╗███████║
╚═════╝  ╚═════╝  ╚═════╝╚══════╝╚══════╝╚══════╝
```

[English](../../en/02-syntax/loops.md) | [**Español**](bucles.md)

[Índice de la sección](README.md)

## for

**Qué es:** `for` ejecuta el cuerpo una vez por cada palabra de una lista.

**Sintaxis**
```bash
for item in word1 word2; do
  command "$item"
done
```

**Ejemplo**
```bash
for report in 'annual report.txt' 'budget.txt'; do
  printf '%s\n' "$report"
done
```

**Cómo funciona:** Bash expande la lista y asigna las palabras resultantes a la variable del bucle de una en una.

**Cuándo usarlo:** Procesa argumentos con `for item in "$@"` o recorre las rutas que coinciden con un patrón.

**Importante:** Pon las expansiones entre comillas cuando debas conservar cada valor entero. Si la lista está vacía, el bucle no se ejecuta.

## while

**Qué es:** `while` repite el cuerpo mientras la condición devuelve cero.

**Sintaxis**
```bash
while condition; do
  command
done
```

**Ejemplo**
```bash
count=0
while (( count < 3 )); do
  printf '%s\n' "$count"
  count=$(( count + 1 ))
done
```

**Cómo funciona:** Bash ejecuta la condición antes de cada iteración. Un código distinto de cero termina el bucle.

**Cuándo usarlo:** Lee registros hasta que `read` agote la entrada o supervisa una condición con un límite de iteraciones.

**Importante:** Haz que la condición pueda cambiar o utiliza un `break` explícito. `continue` pasa a la siguiente iteración.

## until

**Qué es:** `until` repite el cuerpo mientras la condición devuelve un código distinto de cero.

**Sintaxis**
```bash
until condition; do
  command
done
```

**Ejemplo**
```bash
attempt=0
until (( attempt >= 3 )); do
  attempt=$(( attempt + 1 ))
  printf 'Attempt %s\n' "$attempt"
done
```

**Cómo funciona:** Bash evalúa la condición antes de cada iteración. El bucle termina cuando la prueba devuelve cero.

**Cuándo usarlo:** Espera a que se cumpla una condición, como la aparición de un archivo.

**Importante:** Cuando dependas de un estado externo, limita el número de reintentos y deja un intervalo entre ellos.

[Estructuras de bucle](https://www.gnu.org/software/bash/manual/html_node/Looping-Constructs.html)
