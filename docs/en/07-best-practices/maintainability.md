# Maintainability

[**English**](maintainability.md) | [Español](../../es/07-buenas-practicas/mantenibilidad.md)

[Section index](README.md)

## Keep the interface small

Document the required arguments, defaults and exit statuses. Send results to standard output and diagnostics to standard error so scripts can be composed. Use names that describe the value, such as `threshold` or `log_path`.

## Make failures visible

Check crucial operations where they happen and name the failed action in the diagnostic. Declare the variable separately from the assignment. With `local label=$(date ...)`, `local` reports its own status and can hide a failure from `date`.

```bash
make_label() {
  local label
  label=$(date -u +%Y-%m-%d) || return
  printf '%s\n' "$label"
}
make_label
```

## Document choices that affect execution

State the intended shell and any GNU or Linux-specific dependencies. Prefer a short comment about why a step is needed. Check syntax, run ShellCheck when available and exercise success and failure with temporary data.

[Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html)
