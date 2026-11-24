<!-- Depuración de Bash -->
<a name="depuración-de-bash"></a>

```text
██████╗ ███████╗██████╗ ██╗   ██╗██████╗  █████╗ ██████╗     ██████╗  █████╗ ███████╗██╗  ██╗
██╔══██╗██╔════╝██╔══██╗██║   ██║██╔══██╗██╔══██╗██╔══██╗    ██╔══██╗██╔══██╗██╔════╝██║  ██║
██║  ██║█████╗  ██████╔╝██║   ██║██████╔╝███████║██████╔╝    ██████╔╝███████║███████╗███████║
██║  ██║██╔══╝  ██╔═══╝ ██║   ██║██╔══██╗██╔══██║██╔══██╗    ██╔══██╗██╔══██║╚════██║██╔══██║
██████╔╝███████╗██║     ╚██████╔╝██║  ██║██║  ██║██║  ██║    ██████╔╝██║  ██║███████║██║  ██║
╚═════╝ ╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
```

*Depuración de Bash*

[English](../../en/06-debugging/debugging-bash.md) | [**Español**](depuracion-bash.md)

[Índice de la sección](README.md)

## Comprobar la sintaxis

```bash
bash -n examples/check-disk.sh
```

`bash -n` analiza el archivo sin ejecutar sus comandos. Detecta comillas sin cerrar y terminadores ausentes como `fi`. No puede comprobar si una ruta, un programa o un dato de entrada existe durante la ejecución.

## Seguir la ejecución

```bash
bash -x examples/check-disk.sh / 80
```

`-x` escribe los comandos expandidos en la salida de error justo antes de ejecutarlos. Usa `set -x` y `set +x` alrededor de un tramo corto si la traza completa genera demasiado detalle. Evita incluir datos sensibles en los argumentos que aparecen en la traza o en los registros que guardes.

## Analizar el script

```bash
shellcheck examples/*.sh
```

ShellCheck señala problemas como comillas ausentes o variables a las que se asigna un valor que nunca se lee. Ejecuta también el script con datos temporales. Comprueba tanto la salida esperada como el código de salida.

[Invocación de Bash](https://www.gnu.org/software/bash/manual/html_node/Invoking-Bash.html) · [ShellCheck](https://www.shellcheck.net/)
