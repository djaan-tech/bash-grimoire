# Arrays

[**English**](arrays.md) | [Español](../../es/02-sintaxis/arrays.md)

[Section index](README.md)

## Indexed arrays

**What it is:** An indexed array stores multiple values under integer indices starting at zero.

**Syntax**
```bash
items=(first "second item")
"${items[0]}"
"${items[@]}"
```

**Example**
```bash
files=('annual report.txt' 'budget.txt')
for file in "${files[@]}"; do
  printf '%s\n' "$file"
done
```

**How it works:** Bash stores each assignment word separately. `"${items[@]}"` expands to one word per element and `"${#items[@]}"` gives the number of elements.

**When to use it:** Build an argument list or store filenames without losing their boundaries.

**Important:** Indices can have gaps. Use `"${!items[@]}"` to expand the indices. POSIX `sh` has no Bash-style arrays.

## Associative arrays

**What it is:** An associative array maps string keys to values.

**Syntax**
```bash
declare -A map
map[key]=value
"${map[key]}"
```

**Example**
```bash
declare -A formats=([report]=csv [image]=png)
printf '%s\n' "${formats[report]}"
```

**How it works:** `declare -A` tells Bash to interpret subscripts as keys. `"${map[key]}"` retrieves the value for the key `key`.

**When to use it:** Map known configuration keys to values or modes to extensions.

**Important:** Requires Bash 4 or later. Iteration order is unspecified, and an empty string cannot be used as a key.

[Arrays](https://www.gnu.org/software/bash/manual/html_node/Arrays.html)
