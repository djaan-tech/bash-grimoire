# Variables

[English](../../en/02-syntax/variables.md) | [**Español**](variables.md)

[Índice de la sección](README.md)

## Asignación

**Qué es:** Una variable guarda un valor con un nombre en el intérprete.

**Sintaxis**
```
name=value
name="value with spaces"
```

**Ejemplo**
```bash
report="weekly report.txt"
printf '%s\n' "$report"
```

**Cómo funciona:** Bash reconoce `nombre=valor` como una asignación. En una asignación aislada, expande el valor sin separar palabras ni expandir nombres de archivo.

**Cuándo usarlo:** Guarda una ruta, un ajuste o un resultado intermedio.

**Importante:** No pongas espacios junto a `=`. Escribe entre comillas los valores literales con espacios. Los nombres de las variables distinguen mayúsculas de minúsculas.

## Variables del intérprete, locales y de entorno

**Qué es:** Una variable del intérprete pertenece al intérprete actual.
Las variables exportadas se transmiten en el entorno de los nuevos procesos hijos.

**Sintaxis**
```bash
export name=value
name=value command
local name=value  # Inside a Bash function
```

**Ejemplo**
```bash
mode=brief
export mode
bash -c 'printf "%s\n" "$mode"'
```

**Cómo funciona:** `export` marca `mode` para que se herede. `nombre=valor comando` pone un valor en el entorno de un programa externo durante esa invocación. Dentro de una función, `local` limita el ámbito a esa llamada y a las funciones que esta invoque.

**Cuándo usarlo:** Usa variables de entorno para los ajustes que lee un programa hijo. Usa `local` para variables temporales dentro de las funciones.

**Importante:** Un proceso hijo no puede exportar cambios a su proceso padre. Una variable puede ser local y estar exportada.

[Parámetros del intérprete](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameters.html) · [Entorno](https://www.gnu.org/software/bash/manual/html_node/Environment.html)
