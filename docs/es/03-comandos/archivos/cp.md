<!-- cp — Copiar archivos y directorios -->
<a name="cp--copiar-archivos-y-directorios"></a>

```text
╔═══════════════════╗
║  ██████ ██████    ║
║ ██ ░░░░░██░░░██░  ║
║ ██░░    ██████ ░░ ║
║ ██░░    ██░░░░░░  ║
║  ██████ ██░░      ║
║    ░░░░░░ ░░      ║
╚═══════════════════╝
```

*Copiar archivos y directorios*

[English](../../../en/03-commands/files/cp.md) | [**Español**](cp.md)

[Diccionario de comandos](../README.md) · [Archivos de prácticas](../README.md#archivos-de-prácticas)

**¿Qué hace?**

Copia los datos de un archivo a otra ruta. También puede copiar un árbol de directorios.

**Sintaxis básica**
```bash
cp [options] source destination
```

**Ejemplo práctico**
```bash
cp -i -- ./report.txt './report copy.txt'
```

`-i` pide confirmación antes de sobrescribir un destino existente. `--` marca el fin de las opciones.

**¿Qué sucede internamente?**

Bash conserva el destino entre comillas como un solo argumento. `cp` abre el origen para leer y abre o crea el destino para escribir. Si la copia termina bien, el programa no suele imprimir nada.

**¿Cuándo utilizarlo?**

Crea una copia de trabajo de un archivo o copia un árbol de directorios con `-R`.

**¿Qué debo recordar?**

Si el destino es un directorio, `cp` escribe dentro de él. Para copiar directorios de forma portable, usa `-R` y comprueba qué metadatos conservan las opciones elegidas.

[Documentación oficial](https://www.gnu.org/software/coreutils/manual/html_node/cp-invocation.html)
