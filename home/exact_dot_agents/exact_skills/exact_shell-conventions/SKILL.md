---
name: shell-conventions
description: Functional shell conventions for POSIX sh, bash, and zsh. Use when writing or editing shell scripts (.sh/.bash) or zsh config (.zsh, prompts, hooks, completions, aliases).
---

# Shell Conventions

One root — **predictability**: the same construct chosen every time, so a script's behavior is legible from its text and a class of bugs never occurs.

**Functional core, imperative shell** is how we get there: logic expressed as pure functions, immutable values, and composition; side effects quarantined at the edges. Adhere to it wherever the dialect allows.

A file commits to **one dialect, declared by its shebang** — never mix them. Before writing, read the dialect's file; it holds the concrete syntax that realizes the tenets below:

- [posix.md](posix.md) — portable scripts (`#!/usr/bin/env sh`)
- [bash.md](bash.md) — bash scripts
- [zsh.md](zsh.md) — zsh scripts and interactive config (prompts, hooks, completions)

When a choice between forms is otherwise arbitrary, pick the one written here.

## The functional paradigm (all shells)

### Pure functions

A function is _pure_ when it reads only its arguments and writes only its return channel — no global read or written, no file touched, no environment mutated. Same inputs, same output, every time.

- Return scalars on **stdout**; return collections by the dialect's indirection. Reserve the exit status for success/failure, not data.
- Pass every input explicitly. A function that reads `$VERBOSE` from the environment is reading a global — make it an argument.
- A function that `cd`s, `export`s, writes a file, or calls `exit` is _impure_; push that work to the edges.

### Immutability

- Declare a value once, never reassign: `readonly` at top level, `local -r` in functions.
- Treat collections as values — a transform reads its input read-only and emits a fresh result rather than mutating in place.

### First-class & higher-order functions

A function name is a first-class value: pass it as a string, invoke it through the variable (`"$fn" "$@"`). Functions that take or return functions — `map`, `filter`, `reduce`, `compose` — are the vocabulary. Reach for them before writing a bespoke loop; each dialect file gives the concrete implementation.

### Composition

Build large transforms from small pure ones:

- **Pipelines** — the shell's native left-to-right composition, one process per stage. Prefer them when each stage streams.
- **Nested calls** — right-to-left composition for scalars: `f "$(g "$(h "$x")")"`.
- **A named helper** when a composition recurs (portable — command substitution and positional parameters only):

```sh
chain() {          # chain val f g h  ==  h(g(f(val)))
	local acc=$1; shift
	for fn in "$@"; do
		acc=$("$fn" "$acc")
	done
	printf '%s' "$acc"
}
```

Wrap a pipeline in a function to name the composition; it is itself pure if every stage is.

### Recursion

For naturally recursive problems (tree walks, fold-style accumulation), recursion reads clearer than a state-mutating loop. Each call costs a stack frame and each `$(...)` a subshell fork, so loops still win for very deep iteration — recurse for clarity, not by default.

### Effects at the edges

Side effects are unavoidable at the boundaries: I/O, processes, environment. Concentrate them.

- `main` and a thin layer of I/O wrappers carry every read, write, `cd`, `exec`, `export`, and `trap`. The pure core never sees them.
- Contain an unavoidable `cd` in a subshell: `( cd -- "$dir" && cmd )` does not change the caller's working directory.
- A function passed a tempfile path stays pure; one that _creates_ the tempfile does not.

## Common rules (all shells)

- **Safety over brevity.** Strict mode on every script, quoting on every expansion, `local` on every variable. Verbosity that prevents a class of bugs is cheaper than the bug. (Strict-mode syntax is in each dialect file.)
- **Quote every expansion:** `"$var"`, `"$(cmd)"`, and `"${array[@]}"` where arrays exist. Single-quote literals containing `$`, backticks, or backslashes to opt out of expansion entirely.
- **`--` before variable arguments** to commands that accept flags: `rm -- "$file"`, `cd -- "$dir"`.
- **`printf '%s\n' "$x"` over `echo "$x"`.** `echo` interprets `-e`/`-n`/backslashes inconsistently across shells and versions.
- **Errors to stderr:** `printf '%s\n' "msg" >&2`.
- **Never `eval`** — it breaks referential transparency and invites injection. Use the dialect's indirection instead.
- **Naming.** `snake_case` for functions and variables; `UPPER_SNAKE_CASE` for exported variables and `readonly` constants. Function names are verbs (`build_index`, `parse_args`); predicates start with `is_`/`has_` and return via exit status; array variables are plural (`files`, `users`). One-letter names only inside tight numeric loops (`i`, `j`).
- **Formatting.** Indent with tabs. Multi-line bodies for every `if`, `for`, `while`; never write the body on the header line. One blank line between top-level functions. Break long pipelines and commands with `\` continuations, the continuation indented one tab past the header.

## Done means

Sweep every line you wrote or touched: strict mode present, every expansion quoted, every function variable `local`, `--` before variable arguments, effects only at the edges, the dialect file's rules applied. Every touched line — not most.
