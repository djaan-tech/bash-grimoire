# Ejecución de scripts

[English](../../en/01-fundamentals/running-scripts.md) | [**Español**](ejecucion-de-scripts.md)

[Índice de la sección](README.md)

## Ejecutar un script

**Qué es:** Un script es un archivo de comandos.
Puedes pasárselo a Bash o ejecutarlo directamente.

**Sintaxis**
```bash
bash script.sh [argument ...]
./script.sh [argument ...]
```

**Ejemplo**
```bash
bash examples/check-disk.sh / 100
```

**Cómo funciona:** Con `bash script.sh`, Bash lee el archivo. Con `./script.sh`, Linux lee la primera línea al ejecutarlo. La línea `#!/usr/bin/env bash` invoca `env`, que busca Bash en `PATH`.

**Cuándo usarlo:** Usa `bash` para ejecutar un archivo legible. Para ejecutarlo directamente, indica el intérprete en la primera línea y activa el permiso con `chmod u+x script.sh`.

**Importante:** Ejecuta el ejemplo desde la raíz del repositorio. Los archivos usan finales de línea de Unix (LF).

## Cargar un archivo en el intérprete actual

**Qué es:** `source` lee y ejecuta código en el intérprete actual.

**Sintaxis**
```bash
source file [argument ...]
. ./file
```

**Ejemplo**
```bash
(
  settings=$(mktemp) || exit 1
  trap 'rm -f -- "$settings"' EXIT
  printf '%s\n' 'mode=report' > "$settings" || exit 1
  source "$settings" || exit 1
  printf '%s\n' "$mode"
)
```

**Cómo funciona:** Un archivo cargado puede cambiar variables, funciones, opciones y el directorio de trabajo. El ejemplo aísla los cambios en `( ... )` y borra el archivo temporal cuando termina ese subintérprete.

**Cuándo usarlo:** Carga funciones o una configuración de confianza escrita como código del intérprete.

**Importante:** Carga solo archivos de confianza. Una ruta explícita como `./settings.sh` evita una búsqueda en `PATH`. La forma con punto es la sintaxis POSIX.

[Scripts de Bash](https://www.gnu.org/software/bash/manual/html_node/Shell-Scripts.html)
