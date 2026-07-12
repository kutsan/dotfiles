#!/usr/bin/env bash

set -euo pipefail
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
	local -r dir=$1
	find "$dir" -type f -print0
}

find_all_files() {
	local -r dir=$1
	find_static_files
	find_rendered_files "$dir"
}

create_chezmoi_config() {
	local -r config=$1 source_root=$2

	chezmoi execute-template \
		--init \
		--stdinisatty=false \
		<"$source_root/home/.chezmoi.toml.tmpl" \
		>"$config"
}

render_templates() {
	local -r dir=$1 config=$2 source_root=$3
	local file dest

	while IFS= read -r -d '' file; do
		dest="$dir/${file%.tmpl}"
		mkdir -p -- "$(dirname -- "$dest")"

		# TODO: Find a better way to lint OS-specific templates without overriding `.chezmoi.os`.
		sed 's/\.chezmoi\.os/"darwin"/g' "$file" |
			chezmoi --source "$source_root" --config "$config" execute-template >"$dest"
	done
}

normalize_paths() {
	local -r dir=$1
	sed "s|$dir/||g"
}

main() {
	local -r dir=$1 config=$2 source_root=$3

	render_templates "$dir" "$config" "$source_root" < <(find_template_files)

	find_all_files "$dir" |
		xargs -0 shellcheck --color=always -- |
		normalize_paths "$dir"
}

tmpdir=$(mktemp -d)
readonly tmpdir
tmpconfig=$(mktemp "${TMPDIR:-/tmp}/chezmoi.XXXXXX.toml")
readonly tmpconfig
trap 'rm -rf -- "$tmpdir"; rm -f -- "$tmpconfig"' EXIT INT TERM

create_chezmoi_config "$tmpconfig" "$MISE_PROJECT_ROOT"
main "$tmpdir" "$tmpconfig" "$MISE_PROJECT_ROOT"
