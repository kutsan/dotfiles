# POSIX sh — portable scripts

The lowest common denominator: no arrays, no `[[`, no namerefs, no process substitution. The paradigm still holds — collections stream through stdout and the positional parameters instead of arrays.

- **Shebang:** `#!/usr/bin/env sh`.
- **Strict mode:** `set -eu`. There is no `pipefail` in POSIX — if a pipeline's intermediate failures matter, restructure it or check status per stage.
- **Tests:** `[ ... ]` / `test` only. Quote both operands (`[ "$x" = "$y" ]`); use `=`, not `==`. Join separate `[ ]` with `&&`/`||`, not `-a`/`-o`.
- **Arithmetic:** `$(( ... ))` for values; numeric comparison via `[ "$a" -lt "$b" ]`.
- **Functions:** `name() { ... }`. `local` and `readonly` aren't in POSIX, but every real `/bin/sh` (dash, busybox, bash) supports them — use them.
- **Higher-order over positional parameters** — no arrays needed. Each helper takes a function name and streams results on stdout:

```sh
map() {
	local fn=$1; shift
	for x in "$@"; do
		"$fn" "$x"
	done
}

filter() {
	local pred=$1; shift
	for x in "$@"; do
		"$pred" "$x" && printf '%s\n' "$x"
	done
}

reduce() {
	local fn=$1 acc=$2; shift 2
	for x in "$@"; do
		acc=$("$fn" "$acc" "$x")
	done
	printf '%s' "$acc"
}
```

Collect a stream back into the positional parameters with `set --`: `set -- $(map double 1 2 3)` — this is the one place word splitting is wanted.

- **Recursion:**

```sh
factorial() {
	[ "$1" -le 1 ] && { printf 1; return; }
	printf '%s' "$(( $1 * $(factorial $(( $1 - 1 ))) ))"
}
```

- **Files:** `cmd < file` and `"$(cat file)"` — `$(< file)` is a bashism. Heredocs: `<<EOF`, or `<<-EOF` to strip leading tabs.
- **Avoid bashisms:** `[[`, `((` as a command, arrays, namerefs, `<(...)`, `&>`, `${var:l}`, `${var/a/b}`. If you need one, switch the shebang to bash rather than emulating it.
