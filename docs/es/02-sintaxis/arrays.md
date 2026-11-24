# Arrays

[English](../../en/02-syntax/arrays.md) | [**Español**](arrays.md)

[Índice de la sección](README.md)

## Arrays indexados

**Qué es:** Un array indexado guarda varios valores con índices enteros que empiezan en cero.

**Sintaxis**
```bash
items=(first "second item")
"${items[0]}"
"${items[@]}"
```

**Ejemplo**
```bash
files=('annual report.txt' 'budget.txt')
files[4]='meeting notes.txt'
for file in "${files[@]}"; do
  printf '%s\n' "$file"
done
printf 'Index: %s\n' "${!files[@]}"
```

**Cómo funciona:** `"${files[@]}"` conserva cada nombre como un argumento, aunque contenga espacios. `"${!files[@]}"` da los índices asignados, que aquí son `0`, `1` y `4`. `${#files[@]}` cuenta los tres elementos.

**Cuándo usarlo:** Construye una lista de argumentos o guarda nombres de archivo sin perder sus límites.

**Importante:** Los índices `2` y `3` están sin asignar. Recorre los índices existentes con `"${!files[@]}"`. El número de elementos puede ser menor que el índice más alto. POSIX `sh` carece de los arrays propios de Bash.

`"${files[*]}"` une los valores en un solo argumento con [las mismas reglas de separación que `"$*"`](argumentos.md#reenviar-o-unir-argumentos).

## Arrays asociativos

**Qué es:** Un array asociativo relaciona claves de texto con valores.

**Sintaxis**
```bash
declare -A map
map[key]=value
"${map[key]}"
```

**Ejemplo**
```bash
declare -A formats=([report]=csv [image]=png)
printf '%s\n' "${formats[report]}" "${formats[archive]-unknown}"
```

**Cómo funciona:** `declare -A` indica a Bash que debe interpretar los subíndices como claves. El ejemplo imprime `csv` para `report` y `unknown` para `archive`, que falta. La [expansión con valor alternativo](comillas-y-expansiones.md#expansión-de-parámetros) funciona también con un elemento del array.

**Cuándo usarlo:** Relaciona claves conocidas de configuración con sus valores o modos con sus extensiones.

**Importante:** Requiere Bash 4 o posterior. El orden de recorrido no está especificado y una cadena vacía no sirve como clave.

[Arrays](https://www.gnu.org/software/bash/manual/html_node/Arrays.html)
