# Comillas y expansiones

[English](../../en/02-syntax/quoting-and-expansions.md) | [**Español**](comillas-y-expansiones.md)

[Índice de la sección](README.md)

## Comillas simples y dobles

**Qué es:** Las comillas controlan qué partes de una palabra interpreta y expande Bash.

**Sintaxis**
```bash
'literal text'
"$variable"
```

**Ejemplo**
```bash
name='annual report'
printf '<%s>\n' '$name' "$name"
printf '<%s>\n' $name
```

**Cómo funciona:** Las comillas simples conservan el texto literal. Las dobles permiten la expansión de parámetros, la sustitución de comandos y la expansión aritmética, y protegen sus resultados habituales frente a la separación de palabras y la expansión de nombres de archivo. El último `printf` muestra `<annual>` y `<report>` en líneas separadas porque la expansión va sin comillas.

**Cuándo usarlo:** Pon entre comillas rutas, argumentos y textos que puedan contener espacios o comodines.

**Importante:** Una comilla simple no puede aparecer dentro de comillas simples. [`"$@"`](argumentos.md#reenviar-o-unir-argumentos) conserva una palabra por argumento.

## Expansión de parámetros

**Qué es:** La expansión de parámetros sustituye un valor o le aplica una operación.

**Sintaxis**
```bash
"$name"
"${name}"
"${name:-fallback}"
```

**Ejemplo**
```bash
report=weekly
suffix=''
printf '%s\n' "${report}${suffix:-.txt}" "${report}${suffix-.txt}"
```

**Cómo funciona:** Las llaves delimitan el nombre del parámetro. Una variable vacía tiene un valor asignado (`''`). Una variable sin definir carece de valor. Como `suffix` está vacío, el ejemplo imprime `weekly.txt` con `:-` y `weekly` con `-`.

**Cuándo usarlo:** Define valores predeterminados para ajustes opcionales o construye un nombre de archivo.

| Forma | Cuándo interviene | Efecto |
| --- | --- | --- |
| `${name-fallback}` | Sin definir | Sustituye el valor durante la expansión. |
| `${name:-fallback}` | Sin definir o vacío | Sustituye el valor durante la expansión. |
| `${name:=fallback}` | Sin definir o vacío | Guarda el valor alternativo en la variable y lo expande. |
| `${name:?message}` | Sin definir o vacío | Escribe el mensaje en la salida de error y termina el script si Bash no es interactivo. |

**Importante:** Las dos primeras formas dejan intacta la variable. Pon la expansión entre comillas en comandos ordinarios.

## Sustitución de comandos

**Qué es:** La sustitución de comandos incorpora la salida estándar de un comando a una expansión.

**Sintaxis**
```bash
value=$(command)
```

**Ejemplo**
```bash
value=$(printf '%s\n' total)
printf '[%s]\n' "$value"
```

**Cómo funciona:** Bash ejecuta el comando en un subintérprete y elimina los saltos de línea finales de su salida estándar. La salida de error conserva su destino habitual.

**Cuándo usarlo:** Captura un resultado breve como una fecha, un recuento o una etiqueta generada.

**Importante:** Pon `"$(comando)"` entre comillas al usar el resultado como argumento. Las cadenas de Bash no pueden representar bytes NUL. Usa un archivo o un flujo para datos binarios.

Si necesitas pasar la salida como si fuera un archivo, consulta la [sustitución de procesos](../apendice/sustitucion-de-procesos.md).

## Expansión aritmética

**Qué es:** La expansión aritmética evalúa una expresión entera y sustituye su resultado.

**Sintaxis**
```bash
"$(( expression ))"
```

**Ejemplo**
```bash
count=4
printf '%s\n' "$(( count + 1 ))"
```

**Cómo funciona:** Bash consulta las variables referenciadas por nombre en la expresión y calcula el resultado con enteros de tamaño fijo.

**Cuándo usarlo:** Incrementa un contador o calcula un porcentaje entero.

**Importante:** Los literales enteros con un cero inicial se interpretan en octal. Para dígitos decimales sin signo ya validados, usa `10#`, por ejemplo `$(( 10#08 ))`. Valida el texto y el intervalo antes de evaluar la entrada del usuario.

## Expansión de nombres de archivo

**Qué es:** La expansión de nombres de archivo, también llamada globbing, convierte patrones en las rutas que coinciden.

**Sintaxis**
```bash
command directory/*.ext
```

**Ejemplo**
```bash
# Desde la raíz del repositorio
printf '%s\n' examples/*.sh
```

**Cómo funciona:** Después de separar palabras, Bash expande `*`, `?` y los patrones entre corchetes si están sin comillas. Cada ruta resultante se pasa como un argumento independiente, aunque contenga espacios.

**Cuándo usarlo:** Selecciona archivos por nombre antes de pasárselos a un comando.

**Importante:** Un patrón sin coincidencias se conserva literal por defecto. Con `nullglob` desaparece y con `failglob` Bash da un error. En la configuración habitual, un punto inicial se debe indicar expresamente o habilitar con `dotglob`.

[Expansiones del intérprete](https://www.gnu.org/software/bash/manual/html_node/Shell-Expansions.html) · [Comillas](https://www.gnu.org/software/bash/manual/html_node/Quoting.html)
