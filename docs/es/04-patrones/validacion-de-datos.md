# Validación de datos

[English](../../en/04-patterns/validating-data.md) | [**Español**](validacion-de-datos.md)

[Índice de la sección](README.md) · [Archivos de prácticas](../03-comandos/README.md#archivos-de-prácticas)

## Comprobar si existe un archivo regular

**Problema:** Determina si una ruta apunta a un archivo regular.

**Solución**
```bash
path='report.txt'
if [[ -f $path ]]; then
  printf '%s\n' "$path"
fi
```

**Por qué funciona:** `-f` comprueba el tipo de archivo y sigue los enlaces simbólicos. Usa `-L` para detectar el propio enlace.

**Cuándo aplicarlo:** Comprueba un archivo de entrada antes de abrirlo. Trata también los errores de apertura, porque la ruta puede cambiar tras la prueba.

## Comprobar si existe un directorio

**Problema:** Determina si una ruta apunta a un directorio.

**Solución**
```bash
directory='sample data'
if [[ -d $directory ]]; then
  printf '%s\n' "$directory"
fi
```

**Por qué funciona:** `-d` devuelve cero para los directorios y los enlaces simbólicos que apuntan a uno.

**Cuándo aplicarlo:** Valida un directorio de origen antes de recorrerlo o copiarlo.

## Crear un directorio si hace falta

**Problema:** Prepara un directorio de salida aunque falten sus directorios antecesores.

**Solución**
```bash
directory='sample output'
if ! mkdir -p -- "$directory"; then
  printf '%s\n' 'Cannot create output directory.' >&2
  exit 1
fi
```

**Por qué funciona:** `mkdir -p` crea los componentes que faltan y devuelve cero si el directorio ya existe. `--` marca el fin de las opciones.

**Cuándo aplicarlo:** Prepara rutas de salida sin una comprobación de existencia separada que podría quedar obsoleta.

## Validar un argumento numérico

**Problema:** Admite de uno a tres dígitos decimales y un valor de 0 a 100.

**Solución**
```bash
value=${1-}
if [[ ! $value =~ ^[0123456789]{1,3}$ ]] || (( 10#$value > 100 )); then
  printf '%s\n' 'Expected a value from 0 to 100.' >&2
  exit 2
fi
```

**Por qué funciona:** La expresión regular exige de uno a tres dígitos ASCII. `||` evita el cálculo si el formato falla. `10#` indica que la base es decimal.

**Cuándo aplicarlo:** Valida umbrales y límites pequeños antes de usarlos en cálculos.

## Comprobar si un comando está disponible

**Problema:** Detecta si falta una dependencia antes de iniciar una tarea.

**Solución**
```bash
if ! command -v tar >/dev/null 2>&1; then
  printf '%s\n' 'tar is required.' >&2
  exit 2
fi
```

**Por qué funciona:** `command -v` indica si el intérprete puede resolver el nombre. La redirección descarta el resultado y cualquier diagnóstico.

**Cuándo aplicarlo:** Comprueba herramientas opcionales o informa de una dependencia que falta. La disponibilidad por sí sola no indica qué opciones o versión tiene.
