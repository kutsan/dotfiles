---
name: zsh-conventions
description: Conventions for writing zsh code. Use when editing or writing .zsh files, zsh functions, aliases, completions, prompts, or shell configuration. Covers function definitions, parameter expansion, error handling, quoting, globbing, hooks, and zsh idioms.
---

# Zsh Conventions

Default to forms that also parse as bash / POSIX. Reach for zsh-only features only when functionality requires them and no portable equivalent exists. When the code only runs under zsh, this still gives broader tool support and clearer reading for anyone coming from bash.

## Formatting

- Indent with tabs.
- Write `setopt` names in `UPPER_SNAKE_CASE`.

## Control flow

- **Never** use zsh's alternate forms of complex commands (`if X { Y }`, `for X (list) { Y }`, `foreach X (list) { Y }`, `while X { Y }`). Use POSIX form: `if X; then Y; fi`, `for X in list; do Y; done`. The alternate forms are zsh-only.
- Always multi-line `if` blocks. Inline `for` lists when ≤4 short items, multi-line with `\` continuations otherwise.

## Initialization

- Start autoloaded functions and sourced scripts with `emulate -L zsh` to localize options to zsh defaults; add `-o <opt>` to enable specific options (e.g., `emulate -L zsh -o extended_glob`).
- Use `#!/usr/bin/env zsh` as the shebang for executable scripts.

## Functions & scope

- Define functions as `name() { ... }`.
- Declare function-scoped variables with `local`.
- In functions, prefix externals with `command` and builtins with `builtin` to bypass aliases.
- Declare file-scope globals with `typeset -g` (`-A` assoc, `-a` array, `-x` export).
- Use `unset -f name` to remove functions (POSIX; same behavior as zsh's `unfunction`).

## Parameter expansion

- Default to forms that work in both zsh and bash:
  - Dirname: `${0%/*}` (POSIX) over `${0:h}` (zsh-only).
  - Indexed-array element expansion: `"${array[@]}"` over bare `$array` — bash expands `$array` to the first element only.
- The following zsh-only constructs have no bash equivalent — use them only when functionality requires:
  - `${(q)var}` (shell-quote), `${(s..)var}` / `${(s#:#)var}` (split by delim), `${(f)str}` (split by newlines)
  - `${var:l}` / `${var:u}` (case modifiers), `${=var}` (forced word splitting)
  - `${(@k)arr}` / `${(k)arr}` (assoc-array keys)
- **Never `${!arr[@]}`** — that's bash syntax; in zsh it means name-pattern-matching and triggers "bad substitution".
- For assoc-array subscripts with hyphens, use quoted keys (`${arr['some-key']}` or `${arr["${prefix}suffix"]}`) — unquoted hyphens get parsed as arithmetic subtraction by bash-targeting parsers.
- Use brace expansion (`{1..10}`, `{a,b,c}`) for sequences and alternations.
- Avoid `eval`; use `${(P)var}` for indirect references and arrays for dynamic args.

## Tests & arithmetic

- Use `(( ... ))` for arithmetic and numeric conditions, `$(( ... ))` for substitution.
- Use `[[ ... ]]` for string and file tests.
- To check command existence: prefer `command -v x &>/dev/null` (POSIX). `(( $+commands[x] ))` is faster (pure param expansion against zsh's command-hash) but zsh-only — use it only when startup-time microseconds matter.

## I/O

- Prefer `echo "msg" >&2` for stderr and `printf` for formatted output. `print` is zsh/ksh-only — reserve it for cases where its flags (`-l`, `-r`, `-u<n>`) have no clean POSIX equivalent.
- Use `<<<` for single-string input (`grep foo <<< "$var"`) instead of `echo | cmd`.
- Use `<(cmd)` / `=(cmd)` over manual temp files for command output as input.
- Use `read -k`, `read -s`, `vared` for interactive input.

## Background jobs

- For silent atomic background+disown, `cmd &!` is the only option (zsh-only). `cmd & disown` is POSIX but causes zsh to print `[jobnum] pid` to stderr before disown fires — use `&!` only when that notification is unacceptable.

## Error handling

- Chain `|| return` after critical single commands instead of an `if !` block.
- Errors to stderr: `echo "msg" >&2; return 1`.

## Quoting & arguments

- Use `--` before variable arguments to commands that accept flags (`cd -- "$dir"`, `rm -- "$file"`).
- Zsh doesn't word-split unquoted scalars by default (unlike bash) — quote when passing to externals or matching literals with spaces; bare `$var` is fine elsewhere.

## Globbing & filesystem

- Glob qualifiers (`*(.)`, `*(/)`, `*(N)`, `(#qNm-24)`) are zsh-only with no bash equivalent. Use them only when their succinctness clearly wins over `find` or alternatives that work in both shells.

## Hooks & shipped functions

- Load shipped functions with `autoload -Uz <name>` (e.g., `add-zsh-hook`, `zmv`).
- Register hooks with `add-zsh-hook chpwd my-fn` (not direct array append).

## Completion

- Name `_<command>`, register with `compdef`, prefer `_describe` for single positional.
