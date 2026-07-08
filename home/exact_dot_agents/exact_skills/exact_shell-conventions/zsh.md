# Zsh — config & scripts (extends POSIX sh)

Zsh config _is_ the imperative shell — prompts, hooks, and completions are effectful by nature. Where a config helper carries real logic, keep it pure and compose it.

**Portable-first.** Default to forms that also parse as POSIX/bash; reach for zsh-only features only when functionality requires them and no portable equivalent exists. Portable forms get broader tool support and read clearly to anyone coming from bash — even in zsh-only code.

## Initialization

- `#!/usr/bin/env zsh` as the shebang for executable scripts.
- Start autoloaded functions and sourced scripts with `emulate -L zsh` to localize options to zsh defaults; add `-o <opt>` for specifics (e.g. `emulate -L zsh -o extended_glob`).
- Write `setopt` names in `UPPER_SNAKE_CASE`.

## Control flow

- **Never** use zsh's alternate forms (`if X { Y }`, `for X (list) { Y }`, `foreach`, `while X { Y }`). Use POSIX form: `if X; then Y; fi`, `for X in list; do Y; done`.
- Inline `for` lists when ≤4 short items, multi-line with `\` continuations otherwise.

## Functions & scope

- Define functions as `name() { ... }`; declare function-scoped variables with `local`.
- In functions, prefix externals with `command` and builtins with `builtin` to bypass aliases.
- Declare file-scope globals with `typeset -g` (`-A` assoc, `-a` array, `-x` export).
- Use `unset -f name` to remove functions (POSIX; same behavior as zsh's `unfunction`).

## Parameter expansion

- Portable-first applies here hardest:
  - Dirname: `${0%/*}` (POSIX) over `${0:h}` (zsh-only).
  - Indexed-array element expansion: `"${array[@]}"` over bare `$array` — bash expands `$array` to the first element only.
- Zsh-only constructs with no bash equivalent — use only when functionality requires:
  - `${(q)var}` (shell-quote), `${(s..)var}` / `${(s#:#)var}` (split by delim), `${(f)str}` (split by newlines)
  - `${var:l}` / `${var:u}` (case modifiers), `${=var}` (forced word splitting)
  - `${(@k)arr}` / `${(k)arr}` (assoc-array keys)
- **Never `${!arr[@]}`** — that's bash syntax; in zsh it means name-pattern-matching and triggers "bad substitution".
- For assoc-array subscripts with hyphens, use quoted keys (`${arr['some-key']}`) — unquoted hyphens get parsed as arithmetic subtraction by bash-targeting parsers.
- Use brace expansion (`{1..10}`, `{a,b,c}`) for sequences and alternations.
- For indirection, use `${(P)var}`; arrays for dynamic args.

## Tests & arithmetic

- `(( ... ))` for arithmetic and numeric conditions, `$(( ... ))` for substitution.
- `[[ ... ]]` for string and file tests.
- Command existence: prefer `command -v x >/dev/null 2>&1` (POSIX). `(( $+commands[x] ))` is faster (pure param expansion against zsh's command-hash) but zsh-only — use it only when startup-time microseconds matter.

## I/O

- Deliberate override of the common `printf` rule: in a zsh-only file the interpreter is fixed, so `echo "msg" >&2` is fine for plain stderr strings; keep `printf` for formatted output. `print` is zsh/ksh-only — reserve it for cases where its flags (`-l`, `-r`, `-u<n>`) have no clean POSIX equivalent.
- `<<<` for single-string input (`grep foo <<< "$var"`) instead of `echo | cmd`.
- `<(cmd)` / `=(cmd)` over manual temp files for command output as input.
- `read -k`, `read -s`, `vared` for interactive input.

## Background jobs

- For silent atomic background+disown, `&!` is the only zsh option. `& disown` also parses in bash but causes zsh to print `[jobnum] pid` to stderr before disown fires — use `&!` only when that notification is unacceptable.

## Error handling

- After critical single commands, chain `|| return` rather than wrapping in a negated `if` block.

## Globbing & filesystem

- Glob qualifiers (`*(.)`, `*(/)`, `*(N)`, `(#qNm-24)`) are zsh-only with no bash equivalent. Use them only when their succinctness clearly wins over `find` or portable alternatives.

## Hooks & shipped functions

- Load shipped functions with `autoload -Uz <name>` (e.g. `add-zsh-hook`, `zmv`).
- Register hooks with `add-zsh-hook chpwd my-fn` (not direct array append).

## Completion

- Name `_<command>`, register with `compdef`, prefer `_describe` for a single positional.
