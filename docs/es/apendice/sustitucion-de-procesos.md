<!-- Sustitución de procesos -->
<a name="sustitución-de-procesos"></a>

```text
                                                                      ´
███████╗██╗   ██╗███████╗████████╗██╗████████╗██╗   ██╗ ██████╗██╗ ██████╗ ███╗   ██╗
██╔════╝██║   ██║██╔════╝╚══██╔══╝██║╚══██╔══╝██║   ██║██╔════╝██║██╔═══██╗████╗  ██║
███████╗██║   ██║███████╗   ██║   ██║   ██║   ██║   ██║██║     ██║██║   ██║██╔██╗ ██║
╚════██║██║   ██║╚════██║   ██║   ██║   ██║   ██║   ██║██║     ██║██║   ██║██║╚██╗██║
███████║╚██████╔╝███████║   ██║   ██║   ██║   ╚██████╔╝╚██████╗██║╚██████╔╝██║ ╚████║
╚══════╝ ╚═════╝ ╚══════╝   ╚═╝   ╚═╝   ╚═╝    ╚═════╝  ╚═════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝
```

*Sustitución de procesos*

[English](../../en/appendix/process-substitution.md) | [**Español**](sustitucion-de-procesos.md)

[Apéndice](README.md) · [Lectura de archivos](../04-patrones/lectura-de-archivos.md)

**Qué es:** La sustitución de procesos expone la salida o la entrada de un comando como una ruta que otro comando puede abrir.

| Forma | Qué permite hacer |
| --- | --- |
| `<(comando)` | Abrir la ruta para leer la salida estándar de `comando`. |
| `>(comando)` | Abrir la ruta para enviar datos a la entrada estándar de `comando`. |

**Ejemplo**
```bash
count=0
while IFS= read -r line; do
  printf '%s\n' "$line"
  count=$((count + 1))
done < <(printf '%s\n' alpha beta)
printf 'Total: %d\n' "$count"
```

**Cómo funciona:** En `< <(...)`, el primer `<` redirige la entrada del bucle. Bash ejecuta el productor de `<(...)` en segundo plano y expande esa expresión a una ruta. El bucle consume el flujo en el intérprete actual, por lo que al terminar puede imprimir `Total: 2`.

**Cuándo usarlo:** Procesa la salida línea a línea o pásala a una herramienta que pide una ruta y admite leer un flujo. Para guardar la salida como texto en una variable, usa la [sustitución de comandos](../02-sintaxis/comillas-y-expansiones.md#sustitución-de-comandos).

**Importante:** Escribe `<(` o `>(` sin espacio entre los símbolos. El productor tiene su propio código de salida. Si necesitas comprobarlo, puedes generar los datos en un paso previo y ejecutar el bucle solo si ese paso termina correctamente.

[Sustitución de procesos en el manual de GNU Bash](https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html)
