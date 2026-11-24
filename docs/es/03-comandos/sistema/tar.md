<!-- tar — Crear o inspeccionar un archivo empaquetado -->
<a name="tar--crear-o-inspeccionar-un-archivo-empaquetado"></a>

```text
████████╗ █████╗ ██████╗
╚══██╔══╝██╔══██╗██╔══██╗
   ██║   ███████║██████╔╝
   ██║   ██╔══██║██╔══██╗
   ██║   ██║  ██║██║  ██║
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝
```

*Crear o inspeccionar un archivo empaquetado*

[English](../../../en/03-commands/system/tar.md) | [**Español**](tar.md)

[Diccionario de comandos](../README.md) · [Archivos de prácticas](../README.md#archivos-de-prácticas)

**¿Qué hace?**

Agrupa archivos y sus metadatos en un archivo empaquetado. También puede listar o extraer su contenido.

**Sintaxis básica**
```bash
tar -czf archive.tar.gz path ...
tar -tzf archive.tar.gz
```

**Ejemplo práctico**
```bash
tar -czf ./reports.tar.gz ./report.txt
tar -tzf ./reports.tar.gz
```

`-c` crea el archivo, `-t` lista su contenido, `-z` usa gzip y `-f` indica el archivo empaquetado. Ejecuta el ejemplo en el directorio de prácticas. El listado muestra `./report.txt`.

**¿Qué sucede internamente?**

GNU `tar` escribe los metadatos y los datos de los archivos en un solo flujo. Con `-z`, lo pasa por gzip. Con `-t`, lee el archivo empaquetado e imprime los nombres sin extraer los archivos.

**¿Cuándo utilizarlo?**

Empaqueta varios archivos para transferirlos o crea una copia comprimida de un directorio.

**¿Qué debo recordar?**

La creación puede sobrescribir el archivo de salida indicado. Inspecciona el contenido de los archivos empaquetados desconocidos antes de extraerlos. Utiliza un directorio vacío para la extracción. `-z` requiere una versión de `tar` compatible con gzip.

[Documentación oficial](https://www.gnu.org/software/tar/manual/tar.html)
