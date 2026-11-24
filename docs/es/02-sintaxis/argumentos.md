<!-- Argumentos -->
<a name="argumentos"></a>

```text
╔════════════════════════════════════════════════════════════════════════════════════════════╗
║  █████  ██████   ██████  ██    ██ ███    ███ ███████ ███    ██ ████████  ██████  ███████   ║
║ ██ ░░██░██░░░██░██ ░░░░░░██░░  ██░████░ ████░██░░░░░░████░  ██░░ ░██░░░░██ ░░░██░██░░░░░░░ ║
║ ███████░██████ ░██░░ ███ ██░░  ██░██░████ ██░█████   ██░██░ ██░░  ██░░  ██░░  ██░███████   ║
║ ██░░░██░██░░░██░██░░  ██░██░░  ██░██░░██░░██░██░░░░░ ██░░██░██░░  ██░░  ██░░  ██░░ ░░░██░░ ║
║ ██░░ ██░██░░ ██░░██████ ░░██████ ░██░░  ░░██░███████ ██░░ ████░░  ██░░   ██████ ░███████░░ ║
║   ░░   ░░ ░░   ░░  ░░░░░░   ░░░░░░  ░░      ░░ ░░░░░░░ ░░   ░░░░    ░░     ░░░░░░  ░░░░░░░ ║
╚════════════════════════════════════════════════════════════════════════════════════════════╝
```

[English](../../en/02-syntax/arguments.md) | [**Español**](argumentos.md)

[Índice de la sección](README.md)

## Parámetros posicionales

**Qué es:** Bash ofrece los argumentos como `$1`, `$2` y sucesivos.
`$#` da su número y `$0` identifica la invocación.

**Sintaxis**
```bash
script.sh first second
printf '%s\n' "$0" "$#" "$1" "${2-}"
```

**Ejemplo**
```bash
bash -c 'printf "%s: %s argument(s)\n" "$0" "$#"; printf "<%s>\n" "$1" "$2"' demo 'two words' last
```

**Cómo funciona:** Bash asigna cada argumento que recibe a un parámetro posicional distinto. Para `bash -c`, el primer argumento después de la cadena de comandos se convierte en `$0`. A partir de `${10}`, usa llaves.

**Cuándo usarlo:** Lee una ruta, un umbral o un modo que se pasa al script.

**Importante:** Comprueba `$#` primero si un parámetro es obligatorio. `${1-default}` usa un valor predeterminado solo si falta el parámetro.

## Reenviar o unir argumentos

**Qué es:** `"$@"` conserva cada argumento como una palabra independiente.
`"$*"` une los argumentos en una sola palabra.

**Sintaxis**
```bash
command "$@"
printf '%s\n' "$*"
shift [count]
```

**Ejemplo**
```bash
(
  set -- 'two words' 'last'
  printf '<%s>\n' "$@"
  printf 'Joined: %s\n' "$*"
  shift
  printf 'Remaining: %s\n' "$1"
)
```

**Cómo funciona:** Para `"$*"`, Bash usa como separador el primer carácter de `IFS`, un espacio si `IFS` no está definida o ningún separador si está vacía. `shift` descarta parámetros iniciales y vuelve a numerar los restantes.

**Cuándo usarlo:** Reenvía argumentos con `"$@"` y usa `shift` para consumirlos por orden.

**Importante:** Si no hay argumentos, `"$@"` no genera palabras. Comprueba que quedan suficientes argumentos antes de llamar a `shift`.

[Parámetros especiales](https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html)
