# mv — Mover o renombrar rutas

[English](../../../en/03-commands/files/mv.md) | [**Español**](mv.md)

[Diccionario de comandos](../README.md) · [Archivos de prácticas](../README.md#archivos-de-prácticas)

**¿Qué hace?**

Mueve un archivo o directorio a otra ubicación, o cambia su nombre.

**Sintaxis básica**
```bash
mv [options] source destination
```

**Ejemplo práctico**
```bash
mv -i -- ./old.txt ./new.txt
```

`-i` pide confirmación si se va a sobrescribir el destino. `--` marca el fin de las opciones.

**¿Qué sucede internamente?**

En el mismo sistema de archivos, `mv` suele cambiar la entrada de directorio sin copiar los datos. Entre sistemas de archivos, GNU `mv` suele copiar los datos y después eliminar el origen. Si termina bien, no suele imprimir nada.

**¿Cuándo utilizarlo?**

Renombra un archivo o mueve un informe terminado a un directorio de salida.

**¿Qué debo recordar?**

Un directorio de destino existente suele actuar como contenedor. La opción `-T` de GNU obliga a tratar el último operando como el destino exacto. Un traslado entre sistemas de archivos no es atómico.

[Documentación oficial](https://www.gnu.org/software/coreutils/manual/html_node/mv-invocation.html)
