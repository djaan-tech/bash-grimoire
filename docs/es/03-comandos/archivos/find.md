<!-- find — Buscar en un árbol de directorios -->
<a name="find--buscar-en-un-árbol-de-directorios"></a>

```text
███████╗██╗███╗   ██╗██████╗
██╔════╝██║████╗  ██║██╔══██╗
█████╗  ██║██╔██╗ ██║██║  ██║
██╔══╝  ██║██║╚██╗██║██║  ██║
██║     ██║██║ ╚████║██████╔╝
╚═╝     ╚═╝╚═╝  ╚═══╝╚═════╝
```

*Buscar en un árbol de directorios*

[English](../../../en/03-commands/files/find.md) | [**Español**](find.md)

[Diccionario de comandos](../README.md) · [Archivos de prácticas](../README.md#archivos-de-prácticas)

**¿Qué hace?**

Recorre un árbol de directorios, comprueba cada ruta y realiza la acción indicada en las coincidencias.

**Sintaxis básica**
```bash
find start-path [expression]
```

**Ejemplo práctico**
```bash
find . -type f -name '*.log' -print
```

`-type f` selecciona archivos regulares, `-name '*.log'` compara el último componente de la ruta y `-print` muestra las rutas que coinciden. En el directorio de prácticas aparece `./app.log`.

**¿Qué sucede internamente?**

Bash pasa `'*.log'` como patrón literal. `find` visita cada entrada bajo `.`. Comprueba `-type` y `-name` antes de ejecutar `-print` para una coincidencia.

**¿Cuándo utilizarlo?**

Localiza archivos por nombre o tipo. Pasa las coincidencias directamente a un comando con `-exec comando {} +`.

**¿Qué debo recordar?**

Para nombres que puedan contener saltos de línea, usa `-exec` o `-print0`, que separa con NUL, junto con un lector compatible. `-print0` se incorporó a POSIX en 2024 y puede faltar en sistemas antiguos.

[Documentación oficial](https://www.gnu.org/software/findutils/manual/)
