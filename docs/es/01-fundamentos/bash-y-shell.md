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
command -v name
```

**Ejemplo**
```bash
type -t printf
command -v df
```

**Cómo funciona:** `type -t` indica el tipo de comando. `command -v` muestra cómo resolvería Bash el nombre. Tras el análisis y la expansión de alias, para un nombre simple Bash suele buscar primero funciones, después comandos internos y por último en `PATH`.

**Cuándo usarlo:** Comprueba qué implementación usará un script. Utiliza `builtin printf` para elegir expresamente el comando interno de Bash.

**Importante:** Comandos como `printf` y `kill` pueden tener ambas implementaciones.

[Búsqueda de comandos en Bash](https://www.gnu.org/software/bash/manual/html_node/Command-Search-and-Execution.html)
