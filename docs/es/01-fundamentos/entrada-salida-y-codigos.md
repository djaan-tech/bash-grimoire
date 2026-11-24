<!-- Entrada, salida y códigos de salida -->
<a name="entrada-salida-y-códigos-de-salida"></a>

```text
╔═══════════════════════════════════════════════════════════════════════════╗
║ ███████ ███    ██ ████████ ██████   █████  ██████   █████      ██    ██   ║
║ ██░░░░░░████░  ██░░ ░██░░░░██░░░██░██ ░░██░██░░░██░██ ░░██░     ██░ ██ ░░ ║
║ █████   ██░██░ ██░░  ██░░  ██████ ░███████░██░░ ██░███████░░     ████ ░░  ║
║ ██░░░░░ ██░░██░██░░  ██░░  ██░░░██░██░░░██░██░░ ██░██░░░██░░      ██░░░   ║
║ ███████ ██░░ ████░░  ██░░  ██░░ ██░██░░ ██░██████ ░██░░ ██░░      ██░░    ║
║   ░░░░░░░ ░░   ░░░░    ░░    ░░   ░░ ░░   ░░ ░░░░░░  ░░   ░░        ░░    ║
║                                                                           ║
║ ███████  █████  ██      ██ ██████   █████                                 ║
║ ██░░░░░░██ ░░██░██░░    ██░██░░░██░██ ░░██░                               ║
║ ███████ ███████░██░░    ██░██░░ ██░███████░░                              ║
║   ░░░██░██░░░██░██░░    ██░██░░ ██░██░░░██░░                              ║
║ ███████░██░░ ██░███████ ██░██████ ░██░░ ██░░                              ║
║   ░░░░░░░ ░░   ░░ ░░░░░░░ ░░ ░░░░░░  ░░   ░░                              ║
╚═══════════════════════════════════════════════════════════════════════════╝
```

*Entrada, salida y códigos de salida*

[English](../../en/01-fundamentals/io-and-exit-status.md) | [**Español**](entrada-salida-y-codigos.md)

[Índice de la sección](README.md)

## Flujos estándar

**Qué son:** Los tres flujos estándar llevan los datos de entrada, los resultados y los diagnósticos.

**Sintaxis**
```bash
command < input.txt > output.txt 2> errors.txt
```

**Ejemplo**
```bash
printf '%s\n' 'result'
printf '%s\n' 'diagnostic' >&2
```

**Cómo funciona:** Los flujos usan los descriptores 0, 1 y 2, respectivamente. `>&2` envía la salida estándar del comando al mismo destino que su salida de error.

**Cuándo usarlo:** Envía datos a otro programa y deja los diagnósticos en un flujo aparte.

**Importante:** Un comando puede escribir en la salida de error y terminar correctamente.

## Lectura con read

**Qué es:** El comando interno `read` lee una línea de la entrada estándar y la asigna a variables.

**Sintaxis**
```bash
IFS= read -r variable < input.txt
```

**Ejemplo**
```bash
IFS= read -r line <<< '  report\2026  '
printf '<%s>\n' "$line"
```

**Cómo funciona:** Un `IFS` vacío conserva los espacios iniciales y finales. `-r` mantiene las barras inversas. El operador `<<<` de Bash aporta la cadena entre comillas seguida de un salto de línea.

**Cuándo usarlo:** Lee datos del usuario o registros y conserva sus espacios.

**Importante:** Si falta el salto de línea del último registro, `read` puede asignar el texto y devolver un código distinto de cero. Véase la [lectura línea a línea](../04-patrones/lectura-de-archivos.md).

## Redirecciones

**Qué es:** Una redirección cambia el lugar del que lee o al que escribe un comando.

**Sintaxis**
```bash
command < input.txt > output.txt 2> errors.txt
command >> output.txt
command > combined.txt 2>&1
```

**Ejemplo**
```bash
(
  output=$(mktemp) || exit 1
  trap 'rm -f -- "$output"' EXIT
  printf '%s\n' 'first record' > "$output" || exit 1
  printf '%s\n' 'next record' >> "$output" || exit 1
  cat -- "$output"
)
```

**Cómo funciona:** Bash aplica las redirecciones de izquierda a derecha antes de ejecutar el comando. `>` crea o trunca un archivo. `>>` lo crea o añade datos al final. El ejemplo imprime los dos registros.

**Cuándo usarlo:** Guarda un informe, añade datos a un registro o lee un archivo a través de la entrada estándar.

**Importante:** `2>&1` copia el destino actual de la salida estándar a la salida de error. Si va después de `> combined.txt`, ambas salen al archivo. Si va antes, la salida de error conserva el destino original.

## Tuberías

**Qué es:** Una tubería conecta la salida estándar de un comando con la entrada estándar del siguiente.

**Sintaxis**
```bash
producer | consumer
```

**Ejemplo**
```bash
printf '%s\n' alpha beta | wc -l
```

**Cómo funciona:** Bash abre la tubería y los comandos pueden ejecutarse a la vez. `wc -l` cuenta caracteres de salto de línea. La salida de error sigue aparte. Bash también admite `|&` para enviar ambas salidas a la tubería.

**Cuándo usarlo:** Filtra, ordena o resume un flujo de datos sin un archivo intermedio.

**Importante:** Por defecto se usa el código de salida del último comando. Consulta [`pipefail`](../04-patrones/gestion-de-errores.md#pipefail) para detectar fallos anteriores. Bash suele ejecutar cada fase en un subintérprete. La última puede ejecutarse en el intérprete actual con `lastpipe` y el control de trabajos desactivado.

## Código de salida

**Qué es:** El código de salida es un resultado numérico.
Por convenio, cero indica éxito.

**Sintaxis**
```bash
command
status=$?
```

**Ejemplo**
```bash
bash -c 'printf "%s\n" ready; exit 3'
status=$?
printf 'status=%s\n' "$status"
```

**Cómo funciona:** El Bash hijo imprime `ready` y devuelve 3. El intérprete que lo invocó ofrece en `$?` el código de la última tubería que terminó en primer plano.

**Cuándo usarlo:** Decide qué hacer según el resultado, propaga un error o distingue un estado documentado como una búsqueda sin resultados.

**Importante:** Guarda `$?` antes de ejecutar otro comando. Consulta los códigos habituales de Bash en la [hoja de referencia](../../../CHEATSHEET.es.md#códigos-de-salida).

## Ejecución condicional

**Qué es:** `&&` ejecuta el comando siguiente si el primero termina correctamente.
`||` lo ejecuta si el código es distinto de cero.

**Sintaxis**
```bash
first && next
first || fallback
```

**Ejemplo**
```bash
[[ -d . ]] && printf '%s\n' 'directory exists'
[[ -f ./missing-input.txt ]] || printf '%s\n' 'missing input' >&2
```

**Cómo funciona:** Bash omite el comando de la derecha si no se cumple la condición. Ambos operadores se basan en códigos de salida y sirven para conectar cualquier par de comandos.

**Cuándo usarlo:** Condiciona una acción breve o informa de un fallo en una comprobación.

**Importante:** Bash evalúa `&&` y `||` de izquierda a derecha. En `check && action || fallback`, también ejecuta `fallback` si falla `action`. Usa `if` para ramas excluyentes.

[Redirecciones](https://www.gnu.org/software/bash/manual/html_node/Redirections.html) · [Tuberías](https://www.gnu.org/software/bash/manual/html_node/Pipelines.html) · [Códigos de salida](https://www.gnu.org/software/bash/manual/html_node/Exit-Status.html)
