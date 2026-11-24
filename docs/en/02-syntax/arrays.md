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
files[4]='meeting notes.txt'
for file in "${files[@]}"; do
  printf '%s\n' "$file"
done
printf 'Index: %s\n' "${!files[@]}"
```

**How it works:** `"${files[@]}"` keeps each filename as one argument, including names with spaces. `"${!files[@]}"` expands the assigned indices, here `0`, `1` and `4`. `${#files[@]}` counts the three elements.

**When to use it:** Build an argument list or store filenames without losing their boundaries.

**Important:** Indices `2` and `3` are unassigned. Iterate over the existing indices with `"${!files[@]}"`. The element count can be smaller than the highest index. POSIX `sh` has no Bash-style arrays.

`"${files[*]}"` joins the values into one argument using [the same separator rules as `"$*"`](arguments.md#forward-or-join-arguments).

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
printf '%s\n' "${formats[report]}" "${formats[archive]-unknown}"
```

**How it works:** `declare -A` tells Bash to interpret subscripts as keys. The example prints `csv` for `report` and `unknown` for the missing `archive` key. [Expansion with a fallback](quoting-and-expansions.md#parameter-expansion) also works with array elements.

**When to use it:** Map known configuration keys to values or modes to extensions.

**Important:** Requires Bash 4 or later. Iteration order is unspecified, and an empty string cannot be used as a key.

[Arrays](https://www.gnu.org/software/bash/manual/html_node/Arrays.html)
