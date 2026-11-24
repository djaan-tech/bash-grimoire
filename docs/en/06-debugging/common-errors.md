# Common errors

[**English**](common-errors.md) | [Español](../../es/06-depuracion/errores-frecuentes.md)

[Section index](README.md)

## A filename becomes several arguments

An unquoted expansion in an ordinary command can split a value and expand wildcard characters. Pass paths as `"$path"` and forward argument lists as `"$@"`. See [quoting](../02-syntax/quoting-and-expansions.md).

## A counter changes inside a loop and then resets

A loop on the right of a pipeline usually runs in a subshell. Redirect the loop with `done < "$file"` to keep the counter in the current shell. See [line-by-line reading](../04-patterns/reading-files.md#read-one-line-at-a-time).

## The wrong interpreter reads the script

Errors near `[[` or array assignments can occur when `sh` reads Bash code. Run the file with `bash script.sh` or use its Bash shebang and direct execution.

A message containing `bash\r` or `^M` can indicate CRLF line endings in the shebang. Save scripts as LF.

## An expected result looks like a failure

`grep` uses status 1 for no matches. Test it in `if` and save `$?` in `else` before running another command. See [handling an expected nonzero status](../04-patterns/handling-errors.md#handle-an-expected-nonzero-status).
