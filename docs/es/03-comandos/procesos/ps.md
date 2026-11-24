<!-- ps — Consultar los procesos en ejecución -->
<a name="ps--consultar-los-procesos-en-ejecución"></a>

```text
██████╗ ███████╗
██╔══██╗██╔════╝
██████╔╝███████╗
██╔═══╝ ╚════██║
██║     ███████║
╚═╝     ╚══════╝
```

*Consultar los procesos en ejecución*

[English](../../../en/03-commands/processes/ps.md) | [**Español**](ps.md)

[Diccionario de comandos](../README.md)

**¿Qué hace?**

Muestra información sobre los procesos seleccionados que están en ejecución.

**Sintaxis básica**
```bash
ps [options]
```

**Ejemplo práctico**
```bash
ps -p "$$" -o pid,comm
```

`-p "$$"` selecciona el PID del intérprete que lo invoca. `-o pid,comm` muestra las columnas de PID y nombre del comando.

**¿Qué sucede internamente?**

Bash expande `$$` al PID del intérprete. En Linux, procps-ng consulta los datos en `/proc`, selecciona el PID pedido e imprime las columnas una vez.

**¿Cuándo utilizarlo?**

Comprueba un PID conocido o consulta determinados atributos de un proceso.

**¿Qué debo recordar?**

El proceso puede terminar justo después de la instantánea. procps-ng en Linux admite varios estilos de opciones con valores predeterminados y significados diferentes. El ejemplo usa opciones de estilo Unix.

[Documentación oficial](https://man7.org/linux/man-pages/man1/ps.1.html)
