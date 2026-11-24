<!-- du — Estimar el espacio ocupado por rutas -->
<a name="du--estimar-el-espacio-ocupado-por-rutas"></a>

```text
╔════════════════════╗
║ ██████  ██    ██   ║
║ ██░░░██░██░░  ██░░ ║
║ ██░░ ██░██░░  ██░░ ║
║ ██░░ ██░██░░  ██░░ ║
║ ██████ ░░██████ ░░ ║
║   ░░░░░░   ░░░░░░  ║
╚════════════════════╝
```

*Estimar el espacio ocupado por rutas*

[English](../../../en/03-commands/system/du.md) | [**Español**](du.md)

[Diccionario de comandos](../README.md) · [Archivos de prácticas](../README.md#archivos-de-prácticas)

**¿Qué hace?**

Estima el espacio en disco atribuido a archivos y directorios.

**Sintaxis básica**
```bash
du [options] [path ...]
```

**Ejemplo práctico**
```bash
du -sh -- './sample data'
```

`-s` imprime un total por ruta indicada y `-h` presenta los tamaños en un formato fácil de leer. `--` marca el fin de las opciones.

**¿Qué sucede internamente?**

`du` recorre el árbol de directorios y suma los bloques asignados a sus entradas. Por defecto, si varios enlaces duros apuntan al mismo archivo, solo lo cuenta una vez.

**¿Cuándo utilizarlo?**

Localiza un directorio que ocupa mucho espacio en disco o compara árboles de directorios.

**¿Qué debo recordar?**

Un archivo disperso puede ocupar menos espacio en disco del que indica su tamaño lógico. La opción `--apparent-size` de GNU muestra el tamaño lógico. `-h` queda fuera de POSIX.

[Documentación oficial](https://www.gnu.org/software/coreutils/manual/html_node/du-invocation.html)
