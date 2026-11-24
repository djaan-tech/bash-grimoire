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
for file in "${files[@]}"; do
  printf '%s\n' "$file"
done
```

**Cómo funciona:** Bash guarda por separado cada palabra de la asignación. `"${items[@]}"` expande una palabra por elemento y `"${#items[@]}"` da el número de elementos.

**Cuándo usarlo:** Construye una lista de argumentos o guarda nombres de archivo sin perder sus límites.

**Importante:** Los índices pueden tener huecos. Usa `"${!items[@]}"` para expandir los índices. POSIX `sh` carece de los arrays propios de Bash.

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
printf '%s\n' "${formats[report]}"
```

**Cómo funciona:** `declare -A` indica a Bash que debe interpretar los subíndices como claves. `"${map[key]}"` recupera el valor de la clave `key`.

**Cuándo usarlo:** Relaciona claves conocidas de configuración con sus valores o modos con sus extensiones.

**Importante:** Requiere Bash 4 o posterior. El orden de recorrido no está especificado y una cadena vacía no sirve como clave.

[Arrays](https://www.gnu.org/software/bash/manual/html_node/Arrays.html)
