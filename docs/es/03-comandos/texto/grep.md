<!-- grep — Buscar líneas coincidentes -->
<a name="grep--buscar-líneas-coincidentes"></a>

```text
╔════════════════════════════════════╗
║  ██████  ██████  ███████ ██████    ║
║ ██ ░░░░░░██░░░██░██░░░░░░██░░░██░  ║
║ ██░░ ███ ██████ ░█████   ██████ ░░ ║
║ ██░░  ██░██░░░██░██░░░░░ ██░░░░░░  ║
║  ██████ ░██░░ ██░███████ ██░░      ║
║    ░░░░░░  ░░   ░░ ░░░░░░░ ░░      ║
╚════════════════════════════════════╝
```

*Buscar líneas coincidentes*

[English](../../../en/03-commands/text/grep.md) | [**Español**](grep.md)

[Diccionario de comandos](../README.md) · [Archivos de prácticas](../README.md#archivos-de-prácticas)

**¿Qué hace?**

Selecciona líneas que coinciden con un patrón en archivos o en la entrada estándar.

**Sintaxis básica**
```bash
grep [options] -e 'pattern' [file ...]
```

**Ejemplo práctico**
```bash
grep -nF -e 'ERROR' -- ./app.log
```

`-n` antepone los números de línea, `-F` busca texto fijo y `-e` proporciona el patrón. `--` marca el fin de las opciones. El ejemplo muestra las líneas 2 y 3.

**¿Qué sucede internamente?**

`grep` abre el archivo indicado o lee de la entrada estándar. Con `-F` busca una subcadena literal en cada línea y escribe las líneas que coinciden en la salida estándar. Bash se encarga de las comillas.

**¿Cuándo utilizarlo?**

Filtra registros o comprueba si una configuración contiene una cadena concreta.

**¿Qué debo recordar?**

GNU `grep` devuelve 0 si hay coincidencias, 1 si no las hay y 2 si se produce un error. Otras implementaciones pueden usar otro código mayor que 1 para los errores. `-q` puede indicar éxito tras encontrar una coincidencia aunque también se haya producido un error.

[Documentación oficial](https://www.gnu.org/software/grep/manual/html_node/Exit-Status.html)
