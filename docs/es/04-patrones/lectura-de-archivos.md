# Lectura y recorrido de archivos

[English](../../en/04-patterns/reading-files.md) | [**Español**](lectura-de-archivos.md)

[Índice de la sección](README.md) · [Archivos de prácticas](../03-comandos/README.md#archivos-de-prácticas)

## Leer un archivo línea a línea

**Problema:** Lee un archivo de texto y conserva los espacios y las barras inversas.

**Solución**
```bash
log='sample data/notes file.txt'
while IFS= read -r line || [[ -n $line ]]; do
  printf '%s\n' "$line"
done < "$log"
```

**Por qué funciona:** `IFS= read -r` conserva ambos. La segunda condición procesa la última línea, aunque el archivo de prueba no termina en un salto de línea. Al redirigir todo el bucle, sus variables permanecen en el intérprete actual.

**Cuándo aplicarlo:** Procesa registros y formatos basados en líneas. Comprueba que los archivos obligatorios se pueden abrir y trata los fallos de redirección.

## Recorrer archivos que coinciden con un patrón

**Problema:** Aplica una operación a los archivos de texto de un directorio, incluidos los que tienen espacios en el nombre.

**Solución**
```bash
directory='sample data'
for file in "$directory"/*.txt; do
  [[ -f $file ]] || continue
  printf '%s\n' "$file"
done
```

**Por qué funciona:** Bash solo expande `*.txt`, que está fuera de las comillas. Cada coincidencia es una palabra. La prueba omite los directorios y el patrón literal si no hay coincidencias.

**Cuándo aplicarlo:** Recorre archivos regulares visibles o enlaces a ellos en un único nivel. Usa [`find`](../03-comandos/archivos/find.md) para recorrer subdirectorios.

## Pasar una ruta con seguridad

**Problema:** Pasa un nombre de archivo que puede contener espacios, comodines o un guion al principio.

**Solución**
```bash
file='sample data/notes file.txt'
wc -l < "$file"
```

**Por qué funciona:** La expansión entre comillas da una sola ruta a la redirección de Bash. `wc` lee de la entrada estándar, por lo que no interpreta el nombre como opción.

**Cuándo aplicarlo:** Utiliza una redirección con programas que puedan leer un archivo por la entrada estándar. Para pasar el nombre como operando, usa `-- "$file"` si el programa admite `--`. Un `-` aislado aún puede representar la entrada estándar. Escribe `./-` para ese nombre.
