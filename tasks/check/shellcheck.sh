#!/usr/bin/env bash

set -euo pipefail
shopt -s inherit_errexit nullglob
IFS=$'\n\t'

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
	local -r tmpdir=$1
	find "$tmpdir" -type f -print0
}

find_all_files() {
	local -r tmpdir=$1
	find_static_files
	find_rendered_files "$tmpdir"
}

create_chezmoi_config() {
	local -r tmpconfig=$1 source_root=$2

	chezmoi execute-template \
		--init \
		--stdinisatty=false \
		<"$source_root/home/.chezmoi.toml.tmpl" \
		>"$tmpconfig"
}

render_templates() {
	local -r tmpdir=$1 tmpconfig=$2 source_root=$3
	local file dest

	while IFS= read -r -d '' file; do
		dest="$tmpdir/${file%.tmpl}"
		mkdir -p -- "$(dirname -- "$dest")"

		# TODO: Find a better way to lint OS-specific templates without overriding `.chezmoi.os`.
		sed 's/\.chezmoi\.os/"darwin"/g' "$file" |
			chezmoi --source "$source_root" --config "$tmpconfig" execute-template >"$dest"
	done
}

normalize_paths() {
	local -r tmpdir=$1
	sed "s|$tmpdir/||g"
}

main() {
	local -r tmpdir=$1 tmpconfig=$2 source_root=$3

	render_templates "$tmpdir" "$tmpconfig" "$source_root" < <(find_template_files)

	find_all_files "$tmpdir" |
		xargs -0 shellcheck --color=always -- |
		normalize_paths "$tmpdir"
}

tmpdir=$(mktemp -d)
readonly tmpdir
tmpconfig=$(mktemp "${TMPDIR:-/tmp}/chezmoi.XXXXXX.toml")
readonly tmpconfig
trap 'rm -rf -- "$tmpdir"; rm -f -- "$tmpconfig"' EXIT INT TERM

create_chezmoi_config "$tmpconfig" "$MISE_PROJECT_ROOT"
main "$tmpdir" "$tmpconfig" "$MISE_PROJECT_ROOT"
