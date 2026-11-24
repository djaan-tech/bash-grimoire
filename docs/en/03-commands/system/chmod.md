# chmod — Change access permissions

[**English**](chmod.md) | [Español](../../../es/03-comandos/sistema/chmod.md)

[Command dictionary](../README.md) · [Practice files](../README.md#practice-files)

**What does it do?**

Changes a file’s or directory’s permission bits.

**Basic syntax**
```bash
chmod [options] mode path ...
```

**Practical example**
```bash
chmod u+x -- ./job.sh
```

`u+x` adds execute permission for the owner. `--` ends option parsing.

**What happens internally?**

`chmod` reads the current mode for a symbolic change such as `u+x`, adds the owner’s execute bit and asks the kernel to apply the new mode.

**When should I use it?**

Make a script executable or tighten access to a private file.

**What should I remember?**

For a directory, execute permission allows traversal. Review each target before using `-R`, which changes permissions recursively.

[Octal permissions table and examples](../../appendix/octal-permissions.md)

[Upstream reference](https://www.gnu.org/software/coreutils/manual/html_node/chmod-invocation.html)
