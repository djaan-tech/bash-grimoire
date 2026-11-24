# ls — Listar el contenido de un directorio

[English](../../../en/03-commands/files/ls.md) | [**Español**](ls.md)

[Diccionario de comandos](../README.md)

**¿Qué hace?**

Lista las entradas de un directorio o muestra información sobre las rutas indicadas.

**Sintaxis básica**
```bash
ls [options] [path ...]
```

**Ejemplo práctico**
```bash
ls -lah -- .
```

`-l` selecciona el formato largo, `-a` incluye las entradas que empiezan por punto y `-h` muestra tamaños fáciles de leer. `--` marca el fin de las opciones.

**¿Qué sucede internamente?**

`ls` lee las entradas del directorio. Con `-l`, también consulta metadatos como los permisos y el tamaño. La presentación puede variar si la salida estándar va a un terminal.

**¿Cuándo utilizarlo?**

Inspecciona un directorio o comprueba permisos y tamaños de forma interactiva.

**¿Qué debo recordar?**

Usa un patrón del intérprete o `find` cuando un script necesite nombres de archivo exactos. El formato de presentación y los nombres con saltos de línea impiden tratar la salida habitual de `ls` como lista de rutas. `-h` queda fuera de POSIX.

[Documentación oficial](https://www.gnu.org/software/coreutils/manual/html_node/ls-invocation.html)
