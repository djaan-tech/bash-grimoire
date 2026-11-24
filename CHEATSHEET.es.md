<!-- Referencia rápida de Bash -->
<a name="referencia-rápida-de-bash"></a>

```text
                   ´                        ´
 ██████╗ ██╗   ██╗██╗ █████╗     ██████╗  █████╗ ██████╗ ██╗██████╗  █████╗
██╔════╝ ██║   ██║██║██╔══██╗    ██╔══██╗██╔══██╗██╔══██╗██║██╔══██╗██╔══██╗
██║  ███╗██║   ██║██║███████║    ██████╔╝███████║██████╔╝██║██║  ██║███████║
██║   ██║██║   ██║██║██╔══██║    ██╔══██╗██╔══██║██╔═══╝ ██║██║  ██║██╔══██║
╚██████╔╝╚██████╔╝██║██║  ██║    ██║  ██║██║  ██║██║     ██║██████╔╝██║  ██║
 ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝
```

*Referencia rápida de Bash*

[English](CHEATSHEET.md) | [**Español**](CHEATSHEET.es.md)

[Inicio de la guía](README.es.md)

[Variables](#variables-y-expansiones) · [Pruebas](#pruebas-y-condicionales) · [Argumentos](#argumentos-y-arrays) · [Redirecciones](#redirecciones) · [Códigos de salida](#códigos-de-salida) · [Comandos](#comandos-frecuentes)

## Variables y expansiones

| Sintaxis | Uso |
| --- | --- |
| `name=value` | Asigna un valor a una variable. |
| `"$name"` | Expande el valor como un argumento. |
| `"${name:-default}"` | Usa el valor predeterminado si la variable no está definida o está vacía. |
| `export name` | Pasa la variable a los procesos hijos. |
| `value=$(command)` | Captura la salida estándar. |
| `"$(( count + 1 ))"` | Expande un resultado entero. |

## Pruebas y condicionales

| Sintaxis | Uso |
| --- | --- |
| `if condition; then action; fi` | Ejecuta la acción si el código es cero. |
| `elif condition; then action` | Prueba otra condición antes de `else` o `fi`. |
| `else fallback` | Cubre el caso restante antes de `fi`. |
| `[[ $a == "$b" ]]` | Compara cadenas de forma literal. |
| `[[ $a =~ $regex ]]` | Comprueba si coincide una expresión regular. |
| `[[ $n -eq 3 ]]` | Comprueba la igualdad numérica. |
| `case $mode in start) run ;; esac` | Elige una acción según un patrón del intérprete. |

## Bucles y funciones

| Sintaxis | Uso |
| --- | --- |
| `for item in "$@"; do work "$item"; done` | Procesa cada argumento por separado. |
| `while condition; do work; done` | Repite mientras la condición devuelva cero. |
| `until condition; do work; done` | Repite hasta que la condición devuelva cero. |
| `name() { work; }` | Define una función. |
| `local name=value` | Define una variable local en la llamada a la función. |
| `return 2` | Devuelve un código desde una función. |

## Argumentos y arrays

| Sintaxis | Uso |
| --- | --- |
| `$0 / $1 / ${10}` | Lee el nombre de invocación, el primer argumento o el décimo. |
| `$#` | Cuenta los argumentos posicionales. |
| `"$@"` | Conserva cada argumento como una palabra. |
| `"$*"` | Une los argumentos en una palabra según `IFS`. |
| `shift` | Descarta el primer argumento posicional. |
| `items=(a "b c")` | Crea un array indexado. |
| `"${items[@]}"` | Expande una palabra por elemento del array. |

## Comprobaciones de archivos

| Sintaxis | Uso |
| --- | --- |
| `[[ -e $path ]]` | Comprueba si existe la ruta. |
| `[[ -f $path ]]` | Comprueba si es un archivo regular. |
| `[[ -d $path ]]` | Comprueba si es un directorio. |
| `[[ -r $path ]]` | Comprueba el permiso de lectura. |
| `[[ -L $path ]]` | Comprueba si es un enlace simbólico. |

## Operadores y tuberías

```bash
first && next        # Ejecuta next si first devuelve cero.
first || fallback    # Ejecuta fallback si first devuelve otro código.
! command           # Invierte el resultado de éxito o fallo.
producer | consumer # Conecta la salida estándar con la entrada estándar.
```

## Redirecciones

| Sintaxis | Uso |
| --- | --- |
| `command < "$file"` | Lee el archivo por la entrada estándar. |
| `command > "$file"` | Escribe la salida estándar y trunca el archivo. |
| `command >> "$file"` | Añade la salida estándar al final. |
| `command 2> "$errors"` | Redirige la salida de error. |
| `command > "$log" 2>&1` | Envía ambas salidas al archivo. |

## Códigos de salida

| Sintaxis | Uso |
| --- | --- |
| `$?` | Código de la última tubería en primer plano. |
| `exit 0` | Termina el script con éxito. |
| `exit 2` | Termina el script con código 2, habitual para errores de uso. |
| `126 / 127` | Bash encontró un comando que no pudo ejecutar o no encontró el comando, respectivamente. |
| `128 + N` | Código que devuelve Bash si la señal N termina un comando. |
| `set -o pipefail` | Usa el código de la fase fallida más a la derecha, o cero si todas terminan bien. |

## Comandos frecuentes

| Sintaxis | Uso |
| --- | --- |
| `ls -lah -- .` | Inspecciona el directorio actual. |
| `cp -i -- source target` | Copia y pide confirmación antes de sobrescribir. |
| `mv -i -- source target` | Mueve o renombra con confirmación de sobrescritura. |
| `find . -type f -name '*.log'` | Busca archivos regulares con extensión `.log`. |
| `grep -nF -e 'ERROR' app.log` | Muestra las coincidencias con sus números de línea. |
| `awk -F ':' '{print $1}' file` | Imprime el primer campo separado por dos puntos. |
| `sed 's/old/new/g' file` | Imprime el texto con todas las coincidencias sustituidas. |
| `cut -d ':' -f 1 file` | Selecciona el primer campo delimitado. |
| `sort -n file` | Ordena por un valor numérico al principio de cada línea. |
| `wc -l file` | Cuenta caracteres de salto de línea. |
| `ps -p "$$" -o pid,comm` | Muestra el PID y el nombre del intérprete en Linux. |
| `df -h -- .` | Muestra el uso del sistema de archivos actual. |
| `du -sh -- .` | Resume el uso de disco del árbol de directorios actual. |
| `tar -tzf backup.tar.gz` | Lista el contenido de un archivo comprimido con gzip. |
| `date -u +%Y-%m-%d` | Imprime la fecha de hoy en UTC. |

[Diccionario completo](docs/es/03-comandos/README.md) · [Gestión de errores](docs/es/04-patrones/gestion-de-errores.md) · [Anatomía de un script](docs/es/apendice/anatomia-de-un-script.md)
