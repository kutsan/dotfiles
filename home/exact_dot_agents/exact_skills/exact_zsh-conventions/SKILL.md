---
name: zsh-conventions
description: Conventions for writing zsh code. Use when editing or writing .zsh files, zsh functions, aliases, completions, prompts, or shell configuration. Covers function definitions, parameter expansion, error handling, quoting, globbing, hooks, and zsh idioms.
---

# Zsh Conventions

## Formatting

- Indent with tabs.
- Write `setopt` names in `UPPER_SNAKE_CASE`.

## Initialization

- Start autoloaded functions and sourced scripts with `emulate -L zsh` to localize options to zsh defaults; add `-o <opt>` to enable specific options (e.g., `emulate -L zsh -o extended_glob`).
- Use `#!/usr/bin/env zsh` as the shebang for executable scripts.

## Functions & scope

- Define functions as `name() { ... }`.
- Declare function-scoped variables with `local`.
- In functions, prefix externals with `command` and builtins with `builtin` to bypass aliases.
- Declare file-scope globals with `typeset -g` (`-A` assoc, `-a` array, `-x` export).

## Parameter expansion

- Prefer zsh parameter expansion (`${path:h}`, `${path:t}`, `${(f)str}`, `${var//a/b}`) over external tools (`dirname`, `basename`, `tr`, `sed`).
- Use brace expansion (`{1..10}`, `{a,b,c}`) for sequences and alternations.
- Avoid `eval`; use `${(P)var}` for indirect references and arrays for dynamic args.

## Tests & arithmetic

- Use `(( ... ))` for arithmetic and numeric conditions, `$(( ... ))` for substitution.
- Use `[[ ... ]]` for string and file tests.

## I/O

- Use `print` over `echo` (`-u2` for stderr, `-n` no newline, `-l` one-per-line, `-r` raw).
- Use `<<<` for single-string input (`grep foo <<< "$var"`) instead of `echo | cmd`.
- Use `<(cmd)` / `=(cmd)` over manual temp files for command output as input.
- Use `read -k`, `read -s`, `vared` for interactive input.

## Error handling

- Chain `|| return` after critical single commands instead of an `if !` block.
- Errors to stderr: `print -u2 "msg"; return 1`.

## Quoting & arguments

- Use `--` before variable arguments to commands that accept flags (`cd -- "$dir"`, `rm -- "$file"`).
- Zsh doesn't word-split unquoted scalars by default (unlike bash) — quote when passing to externals or matching literals with spaces; bare `$var` is fine elsewhere.

## Globbing & filesystem

- Prefer glob qualifiers (`*(.)`, `*(/)`, `*(N)`) over `find` for simple filesystem queries.

## Hooks & shipped functions

- Load shipped functions with `autoload -Uz <name>` (e.g., `add-zsh-hook`, `zmv`).
- Register hooks with `add-zsh-hook chpwd my-fn` (not direct array append).

## Completion

- Name `_<command>`, register with `compdef`, prefer `_describe` for single positional.
