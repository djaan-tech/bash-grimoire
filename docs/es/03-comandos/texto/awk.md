# awk — Procesar registros y campos

[English](../../../en/03-commands/text/awk.md) | [**Español**](awk.md)

[Diccionario de comandos](../README.md) · [Archivos de prácticas](../README.md#archivos-de-prácticas)

**¿Qué hace?**

Procesa texto estructurado mediante reglas que actúan sobre registros y campos.

**Sintaxis básica**
```bash
awk [options] 'program' [file ...]
```

**Ejemplo práctico**
```bash
awk -F ':' '$2 >= 90 { print $1 }' ./usage.txt
```

`-F ':'` fija los dos puntos como separador de campos. La regla imprime el primer campo de cada registro cuyo segundo campo es al menos 90. Con los datos de prueba, imprime `root`.

**¿Qué sucede internamente?**

Las comillas simples impiden que Bash expanda `$1` y `$2`. `awk` lee un registro cada vez, lo divide en campos y ejecuta la acción si se cumple la condición. `print` añade un salto de línea por defecto.

**¿Cuándo utilizarlo?**

Extrae cifras de informes con separadores sencillos o calcula resúmenes.

**¿Qué debo recordar?**

Pasa valores externos con `awk -v name="$value"` y mantén fijo el programa de `awk`. La separación básica por delimitador no interpreta los campos CSV con separadores entrecomillados. GNU `awk` añade funciones que quedan fuera de POSIX.

[Documentación oficial](https://www.gnu.org/software/gawk/manual/gawk.html)
