<!-- rm — Eliminar entradas del directorio -->
<a name="rm--eliminar-entradas-del-directorio"></a>

```text
██████╗ ███╗   ███╗
██╔══██╗████╗ ████║
██████╔╝██╔████╔██║
██╔══██╗██║╚██╔╝██║
██║  ██║██║ ╚═╝ ██║
╚═╝  ╚═╝╚═╝     ╚═╝
```

*Eliminar entradas del directorio*

[English](../../../en/03-commands/files/rm.md) | [**Español**](rm.md)

[Diccionario de comandos](../README.md)

**¿Qué hace?**

Elimina archivos o, con `-r`, árboles de directorios.

**Sintaxis básica**
```bash
rm [options] file ...
```

**Ejemplo práctico**
```bash
temp_file=$(mktemp) && rm -i -- "$temp_file"
```

`-i` pide confirmación antes de cada borrado. `--` marca el fin de las opciones. `mktemp` crea el archivo de prueba y `&&` solo ejecuta `rm` si se ha creado correctamente.

**¿Qué sucede internamente?**

Bash expande los comodines sin comillas antes de ejecutar `rm`. `rm` pide al sistema que quite cada entrada del directorio. Si borras un enlace duro, los demás nombres del mismo archivo siguen disponibles.

**¿Cuándo utilizarlo?**

Elimina un archivo temporal conocido después de usar su contenido.

**¿Qué debo recordar?**

El borrado no envía los archivos a la papelera. `-r` recorre directorios y `-f` suprime las preguntas e ignora los archivos ausentes. Revisa las rutas expandidas antes de usar el borrado recursivo.

[Documentación oficial](https://www.gnu.org/software/coreutils/manual/html_node/rm-invocation.html)
