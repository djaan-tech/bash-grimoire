<!-- Seguridad -->
<a name="seguridad"></a>

```text
╔════════════════════════════════════════════════════════════════════════╗
║ ███████ ███████  ██████  ██    ██ ██████  ██ ██████   █████  ██████    ║
║ ██░░░░░░██░░░░░░██ ░░░░░░██░░  ██░██░░░██░██░██░░░██░██ ░░██░██░░░██░  ║
║ ███████ █████   ██░░ ███ ██░░  ██░██████ ░██░██░░ ██░███████░██░░ ██░░ ║
║   ░░░██░██░░░░░ ██░░  ██░██░░  ██░██░░░██░██░██░░ ██░██░░░██░██░░ ██░░ ║
║ ███████░███████  ██████ ░░██████ ░██░░ ██░██░██████ ░██░░ ██░██████ ░░ ║
║   ░░░░░░░ ░░░░░░░  ░░░░░░   ░░░░░░  ░░   ░░ ░░ ░░░░░░  ░░   ░░ ░░░░░░  ║
╚════════════════════════════════════════════════════════════════════════╝
```

[English](../../en/07-best-practices/security.md) | [**Español**](seguridad.md)

[Índice de la sección](README.md)

## Tratar la entrada como datos

Pon entre comillas las expansiones en argumentos de comandos. Si la herramienta lo admite, coloca `--` antes de las rutas para evitar que se interpreten como opciones. Utiliza comandos de sintaxis fija y pasa los valores variables como argumentos. Usa un formato fijo de `printf`, como `printf '%s\n' "$value"`.

Usa un formato de datos para configuraciones que no sean de confianza. `source` y `eval` interpretan el texto como código del intérprete. Valida el texto numérico antes de usar `(( ))` o `$(( ))`, donde Bash puede interpretar el contenido de las variables como expresiones.

## Utilizar archivos temporales privados

```bash
scratch=$(mktemp -d) || exit 1
report="$scratch/result.txt"
printf '%s\n' 'example data' > "$report"
rm -- "$report"
rmdir -- "$scratch"
```

`mktemp -d` crea un directorio privado con un nombre imprevisible. El ejemplo elimina solo el archivo y el directorio que acaba de crear. En scripts más largos, registra un manejador de salida en cuanto se cree el directorio para que también se limpie si se produce un fallo normal.

## Limitar el acceso

Ejecuta el script con los permisos que realmente necesita. Usa directorios de confianza y un `PATH` explícito para las tareas programadas. Usa `umask 077` cuando los nuevos archivos de datos deban ser privados. Activa las trazas solo cuando los valores expandidos puedan divulgarse sin riesgo.

[Manual de mktemp de GNU](https://www.gnu.org/software/coreutils/manual/html_node/mktemp-invocation.html)
