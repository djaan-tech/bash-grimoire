<!-- Procesos y subintérpretes -->
<a name="procesos-y-subintérpretes"></a>

```text
╔══════════════════════════════════════════════════════════════════════════════════════════════════════╗
║ ██████ ██████  ██████  ████████████████████ ██████ ███████    ██    ██                               ║
║ ██░░░████░░░████ ░░░████ ░░░░██░░░░░██░░░░░██ ░░░████░░░░░░░   ██░ ██ ░░                             ║
║ ██████ ██████ ██░░  ████░░   █████  █████████░░  █████████      ████ ░░                              ║
║ ██░░░░░██░░░████░░  ████░░   ██░░░░░  ░░░████░░  ██░░░░░██░░     ██░░░                               ║
║ ██░░   ██░░ ██░██████ ░████████████████████░██████ ███████░░     ██░░                                ║
║   ░░     ░░   ░░ ░░░░░░  ░░░░░░░░░░░░░░░░░░░░ ░░░░░░ ░░░░░░░       ░░                                ║
║                                                                                                      ║
║                                             ´                                                        ║
║ █████████    ████████ █████    ███████████████████████ ██████ ██████ █████████████████████████████   ║
║ ██░░░░░██░░  ████░░░████████░  ██░░░██░░░██░░░░░██░░░████░░░████░░░████░░░░░░░░██░░░██░░░░░██░░░░░░░ ║
║ █████████░░  ████████ ████░██░ ██░░ ██░░ █████  ██████ ██████ ██████ █████     ██░░ █████  ███████   ║
║   ░░░████░░  ████░░░██████░░██░██░░ ██░░ ██░░░░░██░░░████░░░░░██░░░████░░░░░   ██░░ ██░░░░░  ░░░██░░ ║
║ ███████░██████ ██████ ████░░ ████░░ ██░░ █████████░░ ████░░   ██░░ █████████   ██░░ ██████████████░░ ║
║   ░░░░░░░ ░░░░░░ ░░░░░░ ░░░░   ░░░░   ░░   ░░░░░░░░░   ░░░░     ░░   ░░░░░░░░░   ░░   ░░░░░░░░░░░░░░ ║
╚══════════════════════════════════════════════════════════════════════════════════════════════════════╝
```

[English](../../en/01-fundamentals/processes-and-subshells.md) | [**Español**](procesos-y-subshells.md)

[Índice de la sección](README.md)

## Proceso y PID

**Qué es:** Un proceso es un programa en ejecución con su propio identificador o PID.

**Sintaxis**
```bash
command &
pid=$!
wait "$pid"
```

**Ejemplo**
```bash
sleep 1 &
pid=$!
printf 'PID=%s\n' "$pid"
wait "$pid"
```

**Cómo funciona:** `&` inicia el comando de forma asíncrona. `$!` identifica el proceso del último trabajo en segundo plano. En este ejemplo de un solo comando, `wait` devuelve su código de salida.

**Cuándo usarlo:** Inicia una tarea independiente en segundo plano y espera antes de usar su resultado.

**Importante:** Guarda `$!` antes de lanzar otro trabajo en segundo plano. `$$` conserva el PID del intérprete original dentro de un subintérprete. `$BASHPID` da el PID del proceso Bash actual.

## Subintérprete

**Qué es:** Un subintérprete es una copia del entorno de ejecución del intérprete.

**Sintaxis**
```bash
( command; another_command )
```

**Ejemplo**
```bash
mode=outside
( mode=inside; printf '%s\n' "$mode" )
printf '%s\n' "$mode"
```

**Cómo funciona:** Bash aísla el estado del intérprete para ese grupo. Las variables y los cambios de directorio quedan dentro del subintérprete. La salida utiliza los descriptores heredados salvo que se redirijan.

**Cuándo usarlo:** Cambia temporalmente de directorio o de opciones para ejecutar un grupo de comandos.

**Importante:** Los cambios en archivos sí afectan al sistema de archivos. `(comando)` agrupa comandos y `$(comando)` incorpora su salida estándar a una palabra.

[Entorno de ejecución](https://www.gnu.org/software/bash/manual/html_node/Command-Execution-Environment.html)
