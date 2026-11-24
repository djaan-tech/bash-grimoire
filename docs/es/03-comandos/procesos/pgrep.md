# pgrep — Buscar PID por nombre

[English](../../../en/03-commands/processes/pgrep.md) | [**Español**](pgrep.md)

[Diccionario de comandos](../README.md)

**¿Qué hace?**

Lista los PID de los procesos cuyo nombre o línea de comandos coincide con una expresión regular.

**Sintaxis básica**
```bash
pgrep [options] 'pattern'
```

**Ejemplo práctico**
```bash
pgrep -x -l bash
```

`-x` exige que coincida el nombre completo. `-l` incluye el nombre junto a cada PID. Ejecútalo desde un terminal de Bash para buscar procesos de Bash en ejecución.

**¿Qué sucede internamente?**

En Linux, procps-ng lee los datos en `/proc`, aplica una expresión regular extendida e imprime una coincidencia por línea.

**¿Cuándo utilizarlo?**

Comprueba si se ejecuta un proceso con un nombre determinado o localiza PID para inspeccionarlos.

**¿Qué debo recordar?**

Con procps-ng, el código 1 indica que no hay coincidencias. El nombre que se usa por defecto está limitado a 15 bytes en Linux. `-f` busca en toda la línea de comandos y puede ampliar mucho las coincidencias.

[Documentación oficial](https://man7.org/linux/man-pages/man1/pgrep.1.html)
