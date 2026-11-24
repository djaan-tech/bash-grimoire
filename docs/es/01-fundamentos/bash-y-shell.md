# Bash y el intérprete de órdenes

[English](../../en/01-fundamentals/bash-and-shell.md) | [**Español**](bash-y-shell.md)

[Índice de la sección](README.md)

## Intérprete de órdenes y Bash

**Qué es:** Un intérprete de órdenes lee comandos y los ejecuta.
Bash es un intérprete con su propia sintaxis de programación.

**Sintaxis**
```bash
bash [options] [script [argument ...]]
```

**Ejemplo**
```bash
bash -c 'printf "%s\n" "Bash is running"'
```
**Cómo funciona:** Con `-c`, Bash interpreta la cadena como código y ejecuta su comando interno `printf`. El intérprete que lo invoca pasa la cadena entre comillas como un solo argumento.

**Cuándo usarlo:** Utiliza Bash para automatizar tareas que combinan herramientas del sistema con pruebas, bucles o funciones.

**Importante:** Para POSIX `sh`, evita elementos propios de Bash como `[[ ]]` y los arrays. `sh script.sh` selecciona el `sh` del sistema.

## Comandos internos y programas externos

**Qué son:** Un comando interno forma parte de Bash.
Un programa externo es un ejecutable independiente.

**Sintaxis**
```bash
type -t name
type -a name
command -v name
```

**Ejemplo**
```bash
type -t printf
type -a printf
command -v df
```

**Cómo funciona:** `type -t printf` muestra `builtin` en una sesión sin redefiniciones. `type -a printf` también lista los ejecutables con ese nombre que encuentra en `PATH`. Tras expandir los alias, Bash suele buscar primero funciones, después comandos internos y por último en `PATH`.

**Cuándo usarlo:** Usa `command -v` para comprobar desde un script si Bash puede resolver un nombre. Devuelve un código distinto de cero si no lo encuentra. Usa `type -a` al investigar por qué se ejecuta una implementación determinada.

**Importante:** `help printf` documenta el comando interno y `builtin printf` lo selecciona expresamente. Otros nombres, como `kill`, también pueden tener una versión interna y otra externa.

[Búsqueda de comandos en Bash](https://www.gnu.org/software/bash/manual/html_node/Command-Search-and-Execution.html)
