<!-- Permisos octales con chmod -->
<a name="permisos-octales-con-chmod"></a>

```text
███╗   ███╗ ██████╗ ██████╗  ██████╗      ██████╗  ██████╗████████╗ █████╗ ██╗
████╗ ████║██╔═══██╗██╔══██╗██╔═══██╗    ██╔═══██╗██╔════╝╚══██╔══╝██╔══██╗██║
██╔████╔██║██║   ██║██║  ██║██║   ██║    ██║   ██║██║        ██║   ███████║██║
██║╚██╔╝██║██║   ██║██║  ██║██║   ██║    ██║   ██║██║        ██║   ██╔══██║██║
██║ ╚═╝ ██║╚██████╔╝██████╔╝╚██████╔╝    ╚██████╔╝╚██████╗   ██║   ██║  ██║███████╗
╚═╝     ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝      ╚═════╝  ╚═════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝
```

*Permisos octales con chmod*

[English](../../en/appendix/octal-permissions.md) | [**Español**](permisos-octales.md)

[Apéndice](README.md) · [Ficha de chmod](../03-comandos/sistema/chmod.md)

## Cómo leer los tres dígitos

`chmod` interpreta los modos numéricos en **octal** (base 8). Los tres últimos dígitos corresponden, de izquierda a derecha, a la persona propietaria (`u`, *user*), al grupo (`g`, *group*) y al resto (`o`, *others*). Cada dígito suma `4` por lectura, `2` por escritura y `1` por ejecución. Si un permiso está desactivado, aporta cero.

```text
+-------------+-----------------+-----------------+-----------------+
|             | Propietario (u) |    Grupo (g)    |    Resto (o)    |
+-------------+-----+-----+-----+-----+-----+-----+-----+-----+-----+
| Permiso     |  r  |  w  |  x  |  r  |  w  |  x  |  r  |  w  |  x  |
| Peso octal  | 400 | 200 | 100 |  40 |  20 |  10 |   4 |   2 |   1 |
+-------------+-----+-----+-----+-----+-----+-----+-----+-----+-----+
```

Por ejemplo, dar permiso de escritura al grupo añade `020` al modo si ese bit estaba desactivado. La misma letra cambia de peso según su posición.

## Qué significan r, w y x

| Letra | Valor en el dígito | En un archivo | En un directorio |
| --- | --- | --- | --- |
| `r` (*read*) | `4` | Leer el contenido. | Listar los nombres de las entradas. |
| `w` (*write*) | `2` | Modificar el contenido. | Junto con `x`, crear, borrar o renombrar entradas si las demás reglas de acceso lo permiten. |
| `x` (*execute*) | `1` | Ejecutar el archivo si su formato lo permite. | Atravesar el directorio y acceder a sus entradas por nombre. |

En la salida de `ls -l`, un guion `-` dentro de una terna indica que falta ese permiso. El primer carácter indica el tipo de archivo. En `-rwxr-x---`, el guion inicial identifica un archivo regular. Un directorio empieza por `d`.

## Calcular y comprobar un modo

- `750` → `7 = 4 + 2 + 1` (`rwx`), `5 = 4 + 1` (`r-x`), `0` (`---`).
- `444` → `4` (`r--`) en las tres clases. Quita los bits básicos de escritura y ejecución a todas ellas.

Prueba ambos modos sobre un archivo temporal en GNU/Linux. `stat -c` muestra el modo en octal (`%a`) y en letras (`%A`).

```bash
(
  file=$(mktemp) || exit 1
  trap 'rm -f -- "$file"' EXIT
  chmod 750 -- "$file" || exit 1
  stat -c '%a %A' -- "$file" || exit 1
  chmod 444 -- "$file" || exit 1
  stat -c '%a %A' -- "$file"
)
```

```text
750 -rwxr-x---
444 -r--r--r--
```

Git Bash en Windows puede mostrar permisos distintos en sistemas de archivos de Windows.

Un modo como `750` fija los nueve bits básicos. Usa `chmod u+x -- "$file"` para añadir solo ejecución a la persona propietaria y conservar los demás bits básicos.

## El cuarto dígito

Un dígito inicial puede representar bits especiales. `4` es *setuid*, `2` es *setgid* y `1` es el *sticky bit*. En ejecutables compatibles, *setuid* y *setgid* pueden cambiar el usuario o grupo efectivo del proceso. En directorios, *setgid* hace que los archivos creados allí hereden el grupo del directorio y el *sticky bit* restringe quién puede borrar o renombrar entradas.

GNU `chmod` puede conservar *setuid* y *setgid* en los directorios si el modo no indica expresamente que se eliminen.

[Modos numéricos de GNU Coreutils](https://www.gnu.org/software/coreutils/manual/html_node/Numeric-Modes.html) · [Estructura del modo y bits especiales](https://www.gnu.org/software/coreutils/manual/html_node/Mode-Structure.html)
