# Mantenibilidad

[English](../../en/07-best-practices/maintainability.md) | [**Español**](mantenibilidad.md)

[Índice de la sección](README.md)

## Mantener una interfaz pequeña

Documenta los argumentos obligatorios, los valores predeterminados y los códigos de salida. Envía resultados a la salida estándar y diagnósticos a la salida de error para poder combinar scripts. Usa nombres que describan el valor, como `threshold` o `log_path`.

## Hacer visibles los fallos

Comprueba las operaciones importantes en el punto en que se realizan e indica en el diagnóstico qué acción ha fallado. Separa la declaración de la asignación. En `local label=$(date ...)`, `local` devuelve su propio código y puede ocultar un fallo de `date`.

```bash
make_label() {
  local label
  label=$(date -u +%Y-%m-%d) || return
  printf '%s\n' "$label"
}
make_label
```

## Documentar las decisiones que afectan a la ejecución

Indica qué intérprete requiere el script y qué dependencias son específicas de GNU o Linux. Usa comentarios breves que expliquen por qué es necesario un paso. Comprueba la sintaxis, usa ShellCheck si está disponible y prueba situaciones de éxito y fallo con datos temporales.

[Guía de estilo de shell de Google](https://google.github.io/styleguide/shellguide.html)
