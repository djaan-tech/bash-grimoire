# Bash Scripting Handbook

[English](README.md) | [**Español**](README.es.md)

Guía de bolsillo de Bash para automatizar tareas y administrar sistemas Linux.
Consulta la sintaxis, comprueba cómo la interpreta Bash y prueba un ejemplo breve.

[Hoja de referencia](CHEATSHEET.es.md) · [Diccionario de comandos](docs/es/03-comandos/README.md) · [Scripts de ejemplo](examples/README.es.md)

## Objetivo y público

Este manual está dirigido a personas que usan la terminal, escriben sus primeros scripts o mantienen automatizaciones en Linux. Los ejemplos están pensados para Bash 4.4 o posterior en GNU/Linux. Las fichas señalan las dependencias específicas y las diferencias con POSIX `sh`.

## Cómo utilizar la guía

Abre la hoja de referencia para consultar la sintaxis o los patrones para resolver una tarea. Ejecuta un ejemplo con datos de prueba, cambia una entrada y comprueba tanto la salida como el código de salida.

## Índice

1. [Fundamentos](docs/es/01-fundamentos/README.md). Cómo ejecuta Bash los comandos y conecta los procesos.
2. [Sintaxis](docs/es/02-sintaxis/README.md). Construye scripts con variables, pruebas, bucles y funciones.
3. [Diccionario de comandos](docs/es/03-comandos/README.md). Consulta 20 comandos por nombre o por tarea.
4. [Patrones reutilizables](docs/es/04-patrones/README.md). Trabaja con archivos, datos de entrada, errores y argumentos.
5. [Automatización](docs/es/05-automatizacion/README.md). Monitoriza el espacio en disco, crea copias, analiza registros y programa tareas.
6. [Depuración](docs/es/06-depuracion/README.md). Comprueba la sintaxis, sigue las expansiones y localiza fallos frecuentes.
7. [Buenas prácticas](docs/es/07-buenas-practicas/README.md). Escribe scripts con entradas previsibles y un tratamiento claro de los fallos.

[Apéndice](docs/es/apendice/README.md) · [Anatomía de un script Bash](docs/es/apendice/anatomia-de-un-script.md)

## Filosofía

Cada ficha reúne una definición, un ejemplo y el motivo por el que funciona. Comprueba qué interpreta Bash, qué delega a un programa externo y qué código de salida conviene tratar.

## Referencias oficiales

- [Manual de referencia de GNU Bash](https://www.gnu.org/software/bash/manual/bash.html)
- [Manual de GNU Coreutils](https://www.gnu.org/software/coreutils/manual/coreutils.html)
- [Guía de estilo de shell de Google](https://google.github.io/styleguide/shellguide.html)
- [ShellCheck](https://www.shellcheck.net/)

## Lectura complementaria

- Valentine G. Nachi, [Bash Scripting Handbook](https://bashhandbook.com/). La vista previa incluye fundamentos, comandos internos y arrays.

## Contribuir

Edita primero la versión inglesa y actualiza la española en la misma propuesta. Mantén las fichas breves y conserva la equivalencia de los ejemplos y los enlaces entre idiomas. Para cambios en scripts, ejecuta `bash -n`, usa ShellCheck si está disponible y prueba tanto el éxito como los errores con datos temporales.

## Licencia

La documentación y los scripts se distribuyen bajo la [licencia MIT](LICENSE).
