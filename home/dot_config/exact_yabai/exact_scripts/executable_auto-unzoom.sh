#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

parse_windows() {
	jq --raw-output '.[] | [.id, ."has-fullscreen-zoom", ."has-parent-zoom"] | @tsv'
}

exclude_focused_windows() {
	local -r focused=$1
	local row id

	while IFS= read -r row; do
		id=${row%%$'\t'*}

		if [[ $id == "$focused" ]]; then
			continue
		fi

		printf '%s\n' "$row"
	done
}

plan_unzoom() {
	local id fullscreen parent

	while IFS=$'\t' read -r id fullscreen parent; do
		if [[ $fullscreen == true ]]; then
			printf '%s\t%s\n' "$id" zoom-fullscreen
		elif [[ $parent == true ]]; then
			printf '%s\t%s\n' "$id" zoom-parent
		fi
	done
}

apply_unzoom() {
	local id toggle

	while IFS=$'\t' read -r id toggle; do
		yabai --message window "$id" --toggle "$toggle"
	done
}

main() {
	local -r focused_id=$1
	local windows

	windows=$(yabai --message query --windows --space)

	parse_windows <<<"$windows" |
		exclude_focused_windows "$focused_id" |
		plan_unzoom |
		apply_unzoom
}

main "$@"
