# chmod — Cambiar permisos de acceso

[English](../../../en/03-commands/system/chmod.md) | [**Español**](chmod.md)

[Diccionario de comandos](../README.md) · [Archivos de prácticas](../README.md#archivos-de-prácticas)

**¿Qué hace?**

Cambia los bits de permiso de un archivo o directorio.

**Sintaxis básica**
```bash
chmod [options] mode path ...
```

**Ejemplo práctico**
```bash
chmod u+x -- ./job.sh
```

`u+x` añade el permiso de ejecución a la persona propietaria. `--` marca el fin de las opciones.

**¿Qué sucede internamente?**

Para un cambio simbólico como `u+x`, `chmod` consulta los permisos actuales, añade el bit de ejecución del propietario y pide al núcleo que aplique el cambio.

**¿Cuándo utilizarlo?**

Haz ejecutable un script o restringe el acceso a un archivo privado.

**¿Qué debo recordar?**

En un directorio, el permiso de ejecución permite atravesarlo. Revisa cada destino antes de usar `-R`, que cambia los permisos de forma recursiva.

[Tabla de permisos octales y ejemplos](../../apendice/permisos-octales.md)

[Documentación oficial](https://www.gnu.org/software/coreutils/manual/html_node/chmod-invocation.html)
