# kill — Enviar una señal

[English](../../../en/03-commands/processes/kill.md) | [**Español**](kill.md)

[Diccionario de comandos](../README.md)

**¿Qué hace?**

Pide al sistema operativo que entregue una señal a un proceso o, en Bash, a un trabajo del intérprete.

**Sintaxis básica**
```bash
kill [-SIGNAL] pid ...
```

**Ejemplo práctico**
```bash
sleep 30 &
pid=$!
kill -TERM "$pid"
wait "$pid" || :
```

`-TERM` envía `SIGTERM`, que solicita la terminación del proceso de prueba. `$!` captura el PID del hijo. `wait` recoge el código de salida del hijo. `|| :` permite continuar tras el resultado distinto de cero que se espera en este ejemplo.

**¿Qué sucede internamente?**

Bash suele ejecutar su comando interno `kill`. Este pide al núcleo que envíe la señal y devuelve un código de salida. El núcleo comprueba si el emisor tiene permiso para enviar la señal al proceso.

**¿Cuándo utilizarlo?**

Pide a un proceso de trabajo conocido que termine de forma ordenada o envía una señal a un proceso que hayas iniciado.

**¿Qué debo recordar?**

Una entrega correcta no confirma que el proceso haya terminado. `SIGKILL` no se puede capturar ni ignorar e impide la limpieza habitual. Identifica el destino antes de enviar cualquier señal.

[Documentación oficial](https://www.gnu.org/software/bash/manual/html_node/Job-Control-Builtins.html)
