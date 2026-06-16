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

create_chezmoi_config() {
	local tmpconfig=$1

	chezmoi execute-template \
		--init \
		--stdinisatty=false \
		<"$MISE_PROJECT_ROOT/home/.chezmoi.toml.tmpl" \
		>"$tmpconfig"
}

render_templates() {
	local tmpdir=$1 tmpconfig=$2 file dest

	while IFS= read -r -d '' file; do
		dest="$tmpdir/${file%.tmpl}"
		mkdir -p -- "$(dirname -- "$dest")"

		# TODO: Find a better way to lint OS-specific templates without overriding `.chezmoi.os`.
		sed 's/\.chezmoi\.os/"darwin"/g' "$file" |
			chezmoi --source "$MISE_PROJECT_ROOT" --config "$tmpconfig" execute-template >"$dest"
	done
}

normalize_paths() {
	local tmpdir=$1
	sed "s|$tmpdir/||g"
}

main() {
	local tmpdir=$1 tmpconfig=$2

	find_template_files | render_templates "$tmpdir" "$tmpconfig"

	find_all_files "$tmpdir" |
		xargs -0 shellcheck --color=always -- |
		normalize_paths "$tmpdir"
}

tmpdir=$(mktemp -d)
tmpconfig=$(mktemp "${TMPDIR:-/tmp}/chezmoi.XXXXXX.toml")
trap 'rm -rf -- "$tmpdir"; rm -f -- "$tmpconfig"' EXIT INT TERM

create_chezmoi_config "$tmpconfig"
main "$tmpdir" "$tmpconfig"
