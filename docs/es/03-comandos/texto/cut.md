<!-- cut — Extraer columnas o campos -->
<a name="cut--extraer-columnas-o-campos"></a>

```text
 ██████╗██╗   ██╗████████╗
██╔════╝██║   ██║╚══██╔══╝
██║     ██║   ██║   ██║
██║     ██║   ██║   ██║
╚██████╗╚██████╔╝   ██║
 ╚═════╝ ╚═════╝    ╚═╝
```

*Extraer columnas o campos*

[English](../../../en/03-commands/text/cut.md) | [**Español**](cut.md)

[Diccionario de comandos](../README.md) · [Archivos de prácticas](../README.md#archivos-de-prácticas)

**¿Qué hace?**

Extrae campos o posiciones concretas de cada línea.

**Sintaxis básica**
```bash
cut -d delimiter -f list [file ...]
```

**Ejemplo práctico**
```bash
cut -d ':' -f 1 ./usage.txt
```

`-d ':'` fija los dos puntos como delimitador y `-f 1` selecciona el primer campo. El ejemplo imprime `root` y `data` en líneas separadas.

**¿Qué sucede internamente?**

`cut` busca delimitadores en cada línea, numera los campos a partir de 1 y escribe los seleccionados en su orden original. Por defecto, las líneas sin delimitador salen enteras.

**¿Cuándo utilizarlo?**

Extrae un identificador de una lista con delimitadores uniformes.

**¿Qué debo recordar?**

Usa `-s` para omitir líneas sin delimitador. Si el CSV tiene campos entrecomillados, usa un analizador de CSV. En [GNU Coreutils anterior a 9.11](https://lists.gnu.org/archive/html/coreutils-announce/2026-04/msg00000.html), `-c` selecciona posiciones en bytes, igual que `-b`.

[Documentación oficial](https://www.gnu.org/software/coreutils/manual/html_node/cut-invocation.html)
