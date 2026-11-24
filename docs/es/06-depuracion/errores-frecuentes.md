# Errores frecuentes

[English](../../en/06-debugging/common-errors.md) | [**Español**](errores-frecuentes.md)

[Índice de la sección](README.md)

## Un nombre de archivo se convierte en varios argumentos

Una expansión sin comillas en un comando ordinario puede dividir el valor y expandir los comodines. Pasa las rutas como `"$path"` y reenvía las listas de argumentos como `"$@"`. Véase el uso de [comillas](../02-sintaxis/comillas-y-expansiones.md).

## Un contador cambia dentro de un bucle y luego recupera su valor

Un bucle a la derecha de una tubería suele ejecutarse en un subintérprete. Redirige la entrada del bucle con `done < "$file"` para conservar el contador en el intérprete actual. Consulta la [lectura línea a línea](../04-patrones/lectura-de-archivos.md#leer-un-archivo-línea-a-línea).

## El script se abre con el intérprete equivocado

Pueden aparecer errores junto a `[[` o a una asignación de array si `sh` lee código de Bash. Ejecuta el archivo con `bash script.sh` o ejecútalo directamente con la primera línea que indica Bash.

Un mensaje que contenga `bash\r` o `^M` puede indicar finales de línea CRLF en la primera línea. Guarda los scripts con finales LF.

## Un resultado previsto parece un fallo

`grep` devuelve 1 cuando no hay coincidencias. Compruébalo con `if` y guarda `$?` dentro de `else` antes de ejecutar otro comando. Consulta [cómo tratar un código distinto de cero previsto](../04-patrones/gestion-de-errores.md#tratar-un-código-distinto-de-cero-previsto).
