# Bash Scripting Handbook

[**English**](README.md) | [Español](README.es.md)

A pocket reference for Bash scripting, task automation and Linux administration.
Look up syntax, see what Bash does and try a short example.

[Cheat sheet](CHEATSHEET.md) · [Command dictionary](docs/en/03-commands/README.md) · [Example scripts](examples/README.md)

## Purpose and audience

This handbook is for terminal users, first-time script writers and people maintaining Linux automation. The examples target Bash 4.4 or later on GNU/Linux. The cards call out specific dependencies and differences from POSIX `sh`.

## How to use the handbook

Start with the cheat sheet for syntax or the patterns for a task. Run an example on sample data, change one input and check both the output and the exit status.

## Contents

1. [Fundamentals](docs/en/01-fundamentals/README.md). How Bash runs commands and connects processes.
2. [Syntax](docs/en/02-syntax/README.md). Build scripts from variables, tests, loops and functions.
3. [Command dictionary](docs/en/03-commands/README.md). Look up 20 commands by name or task.
4. [Reusable patterns](docs/en/04-patterns/README.md). Handle files, input, errors and arguments.
5. [Automation](docs/en/05-automation/README.md). Monitor disk space, back up directories, analyse logs and schedule jobs.
6. [Debugging](docs/en/06-debugging/README.md). Check syntax, trace expansions and diagnose common failures.
7. [Best practices](docs/en/07-best-practices/README.md). Write scripts with predictable inputs and clear failure paths.

[Appendix](docs/en/appendix/README.md) · [Anatomy of a Bash script](docs/en/appendix/script-anatomy.md)

## Approach

Each card gives a definition, an example and the reason it works. Check what Bash interprets, what it delegates to an external program and which exit status to handle.

## Official references

- [GNU Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)
- [GNU Coreutils Manual](https://www.gnu.org/software/coreutils/manual/coreutils.html)
- [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
- [ShellCheck](https://www.shellcheck.net/)

## Contributing

Edit the English source first and update the Spanish version in the same contribution. Keep cards brief and preserve equivalent examples and language links. For script changes, run `bash -n`, use ShellCheck when available and test both success and failure with temporary data.

## Licence

The documentation and scripts are available under the [MIT licence](LICENSE).
