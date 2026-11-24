<!-- date — Consultar y formatear la hora del sistema -->
<a name="date--consultar-y-formatear-la-hora-del-sistema"></a>

```text
██████╗  █████╗ ████████╗███████╗
██╔══██╗██╔══██╗╚══██╔══╝██╔════╝
██║  ██║███████║   ██║   █████╗
██║  ██║██╔══██║   ██║   ██╔══╝
██████╔╝██║  ██║   ██║   ███████╗
╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝
```

*Consultar y formatear la hora del sistema*

[English](../../../en/03-commands/system/date.md) | [**Español**](date.md)

[Diccionario de comandos](../README.md)

**¿Qué hace?**

Muestra la fecha y la hora actuales con el formato indicado.

**Sintaxis básica**
```bash
date [options] +FORMAT
```

**Ejemplo práctico**
```bash
date -u '+%Y-%m-%dT%H:%M:%SZ'
```

`-u` usa UTC. `+` introduce el formato. `%Y-%m-%d` aporta la fecha, `%H:%M:%S` aporta la hora y los caracteres literales `T` y `Z` marcan la separación de fecha y hora y el uso de UTC.

**¿Qué sucede internamente?**

Bash pasa todo el formato como un solo argumento. `date` lee el reloj, convierte la hora a UTC con `-u` y sustituye cada directiva `%` en la salida.

**¿Cuándo utilizarlo?**

Añade una marca de tiempo a un registro o al nombre de un archivo generado.

**¿Qué debo recordar?**

El ejemplo usa directivas de formato portables. GNU `date -d` interpreta una cadena de fecha. Las variantes BSD utilizan otras opciones para tareas similares.

[Documentación oficial](https://www.gnu.org/software/coreutils/manual/html_node/date-invocation.html)
