# df — Mostrar el uso de un sistema de archivos

[English](../../../en/03-commands/system/df.md) | [**Español**](df.md)

[Diccionario de comandos](../README.md)

**¿Qué hace?**

Muestra el espacio usado y disponible en los sistemas de archivos montados.

**Sintaxis básica**
```bash
df [options] [path ...]
```

**Ejemplo práctico**
```bash
df -h -- .
```

`-h` muestra tamaños fáciles de leer y `--` marca el fin de las opciones. `.` selecciona el sistema de archivos que contiene el directorio actual.

**¿Qué sucede internamente?**

`df` pide al sistema operativo las estadísticas de asignación del sistema de archivos montado que contiene la ruta. Así obtiene el total sin recorrer archivos individuales.

**¿Cuándo utilizarlo?**

Comprueba el espacio de un sistema de archivos montado o supervisa su porcentaje de uso.

**¿Qué debo recordar?**

`-h` es habitual, pero queda fuera de POSIX. La opción `--output=pcent` de GNU selecciona la columna de porcentaje para scripts. [`du`](du.md) mide el espacio atribuido a las rutas.

[Documentación oficial](https://www.gnu.org/software/coreutils/manual/html_node/df-invocation.html)
