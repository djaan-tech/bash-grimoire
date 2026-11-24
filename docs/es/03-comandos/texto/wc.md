<!-- wc — Contar líneas, palabras o bytes -->
<a name="wc--contar-líneas-palabras-o-bytes"></a>

```text
██╗    ██╗ ██████╗
██║    ██║██╔════╝
██║ █╗ ██║██║
██║███╗██║██║
╚███╔███╔╝╚██████╗
 ╚══╝╚══╝  ╚═════╝
```

*Contar líneas, palabras o bytes*

[English](../../../en/03-commands/text/wc.md) | [**Español**](wc.md)

[Diccionario de comandos](../README.md) · [Archivos de prácticas](../README.md#archivos-de-prácticas)

**¿Qué hace?**

Cuenta saltos de línea, palabras, bytes o caracteres en su entrada.

**Sintaxis básica**
```bash
wc [options] [file ...]
```

**Ejemplo práctico**
```bash
wc -l < ./app.log
```

`-l` selecciona el recuento de saltos de línea. El ejemplo imprime `3` sin el nombre del archivo.

**¿Qué sucede internamente?**

Bash abre el archivo como entrada estándar. `wc` busca caracteres de salto de línea en el flujo e imprime el total. `-c` cuenta bytes y `-m` cuenta caracteres según la configuración regional.

**¿Cuándo utilizarlo?**

Cuenta registros en texto con saltos de línea finales o mide un archivo en bytes.

**¿Qué debo recordar?**

Una última línea sin salto de línea no aumenta el recuento de `-l`.

[Documentación oficial](https://www.gnu.org/software/coreutils/manual/html_node/wc-invocation.html)
