# kill — Send a signal

[**English**](kill.md) | [Español](../../../es/03-comandos/procesos/kill.md)

[Command dictionary](../README.md)

**What does it do?**

Asks the operating system to deliver a signal to a process or, in Bash, a shell job.

**Basic syntax**
```bash
kill [-SIGNAL] pid ...
```

**Practical example**
```bash
sleep 30 &
pid=$!
kill -TERM "$pid"
wait "$pid" || :
```

`-TERM` sends `SIGTERM`, which asks the test process to terminate. `$!` captures the child’s PID. `wait` collects the child’s exit status. `|| :` handles the expected nonzero result.

**What happens internally?**

Bash usually runs its `kill` builtin. That builtin asks the kernel to send the signal and returns a status. The kernel checks whether the caller has permission to signal the target.

**When should I use it?**

Ask a known worker to exit gracefully or signal a process you started.

**What should I remember?**

Successful delivery does not confirm that the process has exited. `SIGKILL` cannot be caught or ignored and prevents normal cleanup. Identify the target before sending any signal.

[Upstream reference](https://www.gnu.org/software/bash/manual/html_node/Job-Control-Builtins.html)
