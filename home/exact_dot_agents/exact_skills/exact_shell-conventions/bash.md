# Bash — scripts (extends POSIX sh)

The same paradigm with richer machinery: real arrays and namerefs let a function return a collection _by reference_ instead of only streaming it. Commit to bash; portability to `/bin/sh` is not a goal here.

## Shebang & strict mode

```bash
#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail
shopt -s inherit_errexit nullglob
IFS=$'\n\t'
```

- `#!/usr/bin/env bash` — not `/bin/bash`. macOS ships bash 3.2 at `/bin/bash`; honouring `$PATH` lets users pick a newer one.
- `inherit_errexit` propagates `-e` into `$(...)` subshells — closing the most common errexit gap.
- `nullglob` yields an empty list when a glob matches nothing, so `for f in *.log` does not loop once with `f='*.log'`.
- `IFS=$'\n\t'` drops space from the default, neutralising accidental word-splitting on filenames with spaces.

## Variables & scope

- `local` every variable inside a function. `local -r` is the default; drop the `-r` only when reassignment is intentional. `readonly`/`declare -gr` at top level.
- `local -r name=$(cmd)` masks `cmd`'s exit status — `local` itself succeeds, so errexit can't see the failure. Split into `local -r name; name=$(cmd)` when `cmd` may fail.
- Return collections via **nameref** (`local -n out=$1`); scalars via stdout. Underscore-prefix nameref names (`_in`, `_out`) to avoid collision when the caller passes a same-named array.
- Arrays: `local -a arr=()` (indexed), `local -A map=()` (associative). Always initialise to empty before appending.
- No `g_`-prefixed globals; the prefix doesn't make them safer. Pass state through arguments and namerefs.

## Higher-order primitives

Array/nameref versions of the paradigm's vocabulary: each takes a function name, reads input by read-only nameref, writes a fresh array to an output nameref — so a caller gets a real array back instead of a stream to re-split. No globals touched, no input mutated.

```bash
map() {
	local -r fn=$1
	local -nr _in=$2
	local -n _out=$3
	local x
	_out=()
	for x in "${_in[@]}"; do
		_out+=( "$("$fn" "$x")" )
	done
}
```

`filter` and `reduce` follow the same shape — a function name plus a read-only input nameref, writing to an output nameref (or an accumulator, for `reduce`) — mirroring the streaming versions in [posix.md](posix.md).

## Laziness

Stream, don't materialize. A pipeline or `while IFS= read -r line; do ...; done < <(cmd)` processes input as it arrives, in bounded memory — the practical form of lazy evaluation. Prefer it over reading a whole collection into an array when you only fold over it once. Process substitution keeps the loop in the current shell, so `local`, `set -e`, and `pipefail` still apply. True on-demand generators are non-native; emulate one with a function that prints the next value per call.

## Control flow

- `[[ ... ]]` for string and file tests — never `[` or `test`. `[[` does no word splitting, no glob expansion, and supports `=~` and `&&`/`||`. Quoting the right side of `=`/`==`/`!=` suppresses pattern matching — quote unless you want a glob match.
- `(( ... ))` for arithmetic and numeric comparison; `$(( ... ))` for substitution.
- `case` once branches reach three; chained `elif` only for two.

## I/O

- Read a whole file: `"$(< file)"` — one fork, no `cat`.
- Heredocs: `<<-EOF` (tab-stripping) for indented multi-line literals; `<<<` for a single-line string into stdin.

## Error handling

- Strict mode does most of the work. Add `|| return N` (in functions) or `|| exit N` (top-level) only when you need a specific exit status or extra context before the script dies.
- `trap 'cleanup' EXIT` for tempfile/lockfile cleanup.
- `set -E` plus `trap 'printf "failed at line %s\n" "$LINENO" >&2' ERR` for diagnostic context on unexpected exits.
- Never paper over a failure with `|| true` unless the failure is genuinely meaningless.

## Avoid

- Parsing `ls` output — glob into an array (`local -a files=( *.txt )`) or `find -print0` plus `while IFS= read -r -d '' file`.
- Unguarded `cd` in a sourced script; it changes the caller's shell.
