#!/usr/bin/env bash

set -euo pipefail

find_static_files() {
	find . \
		-type f \
		\( \
		-name '*.sh' -o \
		-name '*.zsh' -o \
		-name 'dot_z*' \
		\) \
		! -name '*.tmpl' \
		-print0
}

find_template_files() {
	find . \
		-type f \
		\( \
		-name '*.sh.tmpl' -o \
		-name 'dot_z*.tmpl' \
		\) \
		-print0
}

find_rendered_files() {
	local tmpdir=$1
	find "$tmpdir" -type f -print0
}

find_all_files() {
	local tmpdir=$1
	find_static_files
	find_rendered_files "$tmpdir"
}

render_templates() {
	local tmpdir=$1 file dest

	while IFS= read -r -d '' file; do
		dest="$tmpdir/$file"
		mkdir -p -- "$(dirname -- "$dest")"
		chezmoi --source "$MISE_PROJECT_ROOT" execute-template --init --stdinisatty=false <"$file" >"$dest"
	done
}

normalize_paths() {
	local tmpdir=$1
	sed "s|$tmpdir/||g"
}

main() {
	local tmpdir=$1

	find_template_files | render_templates "$tmpdir"

	find_all_files "$tmpdir" |
		xargs -0 shellcheck --color=always -- |
		normalize_paths "$tmpdir"
}

tmpdir=$(mktemp -d)
trap 'rm -rf -- "$tmpdir"' EXIT INT TERM
main "$tmpdir"
