# sed — Editar un flujo de texto

[English](../../../en/03-commands/text/sed.md) | [**Español**](sed.md)

[Diccionario de comandos](../README.md) · [Archivos de prácticas](../README.md#archivos-de-prácticas)

**¿Qué hace?**

Transforma texto según un programa de edición.

**Sintaxis básica**
```bash
sed [options] 'script' [file ...]
```

**Ejemplo práctico**
```bash
sed 's/ERROR/WARNING/g' ./app.log
```

`s` sustituye `ERROR` por `WARNING`. La marca `g` aplica el cambio a todas las coincidencias de cada línea.

**¿Qué sucede internamente?**

Bash pasa la expresión de edición como un argumento. `sed` carga una línea en su espacio de patrón, aplica la sustitución y, por defecto, imprime la línea resultante.

**¿Cuándo utilizarlo?**

Sustituye texto, selecciona líneas o normaliza registros antes de pasarlos al siguiente comando de una tubería.

**¿Qué debo recordar?**

El ejemplo conserva el archivo de origen. La opción `-i` modifica los archivos en su ubicación y la sintaxis del sufijo de copia difiere entre GNU y BSD `sed`. Comprueba el resultado antes de modificar el archivo.

[Documentación oficial](https://www.gnu.org/software/sed/manual/sed.html)
