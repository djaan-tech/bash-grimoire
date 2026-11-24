<!-- Condicionales -->
<a name="condicionales"></a>

```text
 ██████╗ ██████╗ ███╗   ██╗██████╗ ██╗ ██████╗██╗ ██████╗ ███╗   ██╗ █████╗ ██╗     ███████╗███████╗
██╔════╝██╔═══██╗████╗  ██║██╔══██╗██║██╔════╝██║██╔═══██╗████╗  ██║██╔══██╗██║     ██╔════╝██╔════╝
██║     ██║   ██║██╔██╗ ██║██║  ██║██║██║     ██║██║   ██║██╔██╗ ██║███████║██║     █████╗  ███████╗
██║     ██║   ██║██║╚██╗██║██║  ██║██║██║     ██║██║   ██║██║╚██╗██║██╔══██║██║     ██╔══╝  ╚════██║
╚██████╗╚██████╔╝██║ ╚████║██████╔╝██║╚██████╗██║╚██████╔╝██║ ╚████║██║  ██║███████╗███████╗███████║
 ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝ ╚═════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
```

[English](../../en/02-syntax/conditionals.md) | [**Español**](condicionales.md)

[Índice de la sección](README.md)

## if, elif y else

**Qué es:** `if` elige una rama según el código de salida de un comando o de una lista de comandos.

**Sintaxis**
```bash
if command; then
  action
elif other_command; then
  other_action
else
  fallback
fi
```

**Ejemplo**
```bash
count=3
if (( count > 5 )); then
  printf '%s\n' 'many'
elif (( count > 0 )); then
  printf '%s\n' 'some'
else
  printf '%s\n' 'none'
fi
```

**Cómo funciona:** Bash evalúa cada condición por orden y entra en la primera rama que obtiene un código cero. `else` cubre los casos restantes.

**Cuándo usarlo:** Ejecuta un paso solo si se cumple una condición o elige entre varios estados.

**Importante:** `elif` y `else` son opcionales. Bash usa el código de salida aunque el comando imprima texto.

## Pruebas de archivos y cadenas

**Qué es:** `[[ ]]` es sintaxis de Bash para pruebas de archivos, cadenas y números.

**Sintaxis**
```bash
[[ -f path ]]
[[ value == pattern ]]
[[ value =~ regex ]]
```

**Ejemplo**
```bash
name=report.txt
if [[ $name == *.txt ]]; then
  printf '%s\n' "$name"
fi
```

**Cómo funciona:** Bash evalúa la expresión y devuelve cero si es verdadera. Dentro de `[[ ]]` omite la separación de palabras y la expansión de nombres de archivo. El lado derecho de `==` sin comillas se interpreta como un patrón del intérprete.

**Cuándo usarlo:** Comprueba el tipo de un archivo, compara texto o valida un formato con `=~`.

**Importante:** Pon el lado derecho de `==` entre comillas para comparar literalmente. POSIX `sh` usa pruebas como `[ -f "$path" ]`.

## Patrones y expresiones regulares

`[[ $name == *.log ]]` comprueba el sufijo con un patrón de Bash. Usa `=~` con una expresión regular extendida si necesitas validar una estructura y extraer partes.

**Ejemplo**
```bash
name=job-074.log
regex='^job-([0-9]+)[.]log$'
if [[ $name =~ $regex ]]; then
  printf 'Job: %s\n' "${BASH_REMATCH[1]}"
fi
```

**Cómo funciona:** `^` y `$` delimitan el nombre completo. `[.]` representa un punto literal y `([0-9]+)` captura uno o más dígitos. Bash guarda la coincidencia completa en `BASH_REMATCH[0]` y el grupo en `BASH_REMATCH[1]`. El ejemplo imprime `Job: 074`.

**Importante:** Guarda el patrón en una variable y expándela sin comillas a la derecha de `=~`. Si pones `"$regex"`, Bash interpreta el patrón como texto literal. La prueba devuelve `0` si coincide, `1` si no coincide y `2` si la expresión no es válida.

## Cadenas y números

**Qué es:** `=` compara cadenas en una prueba.
`-eq` compara enteros.

**Sintaxis**
```bash
[[ $text = "$other_text" ]]
[[ $number -eq $other_number ]]
(( number >= limit ))
```

**Ejemplo**
```bash
value=010
[[ $value = '10' ]] || printf '%s\n' 'different text'
[[ $value -eq 8 ]] && printf '%s\n' 'octal value is eight'
```

**Cómo funciona:** Bash evalúa como expresiones aritméticas los operandos de una comparación numérica en `[[ ]]`. El cero inicial indica que `010` está en octal, por lo que su valor es `8`. Otros operadores numéricos son `-ne`, `-lt`, `-le`, `-gt` y `-ge`. En `(( ))` usa operadores como `==` y `>=`.

**Cuándo usarlo:** Compara una extensión de archivo como texto y un recuento como número.

**Importante:** Las cadenas sin validar pueden interpretarse como expresiones aritméticas. [Valida los dígitos y el intervalo](../04-patrones/validacion-de-datos.md#validar-un-argumento-numérico) antes de evaluar el número.

## case

**Qué es:** `case` elige una rama al comparar una palabra con patrones del intérprete.

**Sintaxis**
```bash
case word in
  pattern) action ;;
  *) fallback ;;
esac
```

**Ejemplo**
```bash
mode=report
case $mode in
  report|summary) printf '%s\n' 'show results' ;;
  *) printf '%s\n' 'unknown mode' >&2 ;;
esac
```

**Cómo funciona:** Bash prueba los patrones por orden. `|` separa alternativas dentro de una rama. `;;` termina la rama seleccionada. `*` sirve para los demás casos.

**Cuándo usarlo:** Selecciona un subcomando o clasifica datos por su sufijo.

**Importante:** Los patrones usan los comodines del intérprete. Coloca los casos específicos antes de `*`.

[Estructuras condicionales](https://www.gnu.org/software/bash/manual/html_node/Conditional-Constructs.html) · [Expresiones condicionales de Bash](https://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html)
