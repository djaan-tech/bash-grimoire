<!-- sort — Ordenar líneas de texto -->
<a name="sort--ordenar-líneas-de-texto"></a>

```text
╔═════════════════════════════════════╗
║ ███████  ██████  ██████  ████████   ║
║ ██░░░░░░██ ░░░██░██░░░██░  ░██░░░░░ ║
║ ███████ ██░░  ██░██████ ░░  ██░░    ║
║   ░░░██░██░░  ██░██░░░██░   ██░░    ║
║ ███████░░██████ ░██░░ ██░░  ██░░    ║
║   ░░░░░░░  ░░░░░░  ░░   ░░    ░░    ║
╚═════════════════════════════════════╝
```

*Ordenar líneas de texto*

[English](../../../en/03-commands/text/sort.md) | [**Español**](sort.md)

[Diccionario de comandos](../README.md)

**¿Qué hace?**

Ordena líneas de texto según las reglas de comparación que elijas.

**Sintaxis básica**
```bash
sort [options] [file ...]
```

**Ejemplo práctico**
```bash
printf '%s\n' 10 2 30 | LC_ALL=C sort -n
```

`-n` compara un valor numérico al principio de la línea. `LC_ALL=C` fija la configuración regional para esta invocación. El resultado es `2`, `10`, `30`, un valor por línea.

**¿Qué sucede internamente?**

Bash conecta `printf` con `sort` mediante una tubería. `sort` compara los números del principio de cada línea y escribe las líneas ordenadas. Las entradas grandes pueden requerir archivos temporales.

**¿Cuándo utilizarlo?**

Ordena un informe por el valor que inicia cada línea o genera resultados reproducibles entre equipos.

**¿Qué debo recordar?**

El orden alfabético y las convenciones numéricas dependen de la configuración regional. GNU `sort -h` puede comparar sufijos de tamaño como `K` y `M`, mientras que `-n` trabaja con números sin sufijos.

[Documentación oficial](https://www.gnu.org/software/coreutils/manual/html_node/sort-invocation.html)
