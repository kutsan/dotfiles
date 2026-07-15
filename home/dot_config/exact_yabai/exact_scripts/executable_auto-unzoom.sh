#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

parse_windows() {
	jq --raw-output '
		.[] | [
			.id,
			"\(.frame.x):\(.frame.y):\(.frame.w):\(.frame.h)",
			.["has-fullscreen-zoom"],
			.["has-parent-zoom"]
		] | @tsv'
}

frame_of() {
	local -r target=$1
	local id frame fullscreen parent

	while IFS=$'\t' read -r id frame fullscreen parent; do
		if [[ $id == "$target" ]]; then
			printf '%s\n' "$frame"
			return 0
		fi
	done

	return 0
}

exclude_node() {
	local -r node=$1
	local id frame fullscreen parent

	while IFS=$'\t' read -r id frame fullscreen parent; do
		if [[ -n $node && $frame == "$node" ]]; then
			continue
		fi

		printf '%s\t%s\t%s\t%s\n' "$id" "$frame" "$fullscreen" "$parent"
	done
}

dedupe_nodes() {
	local seen=$'\n'
	local id frame fullscreen parent

	while IFS=$'\t' read -r id frame fullscreen parent; do
		case $seen in
		*$'\n'"$frame"$'\n'*)
			continue
			;;
		esac

		seen="$seen$frame"$'\n'
		printf '%s\t%s\t%s\t%s\n' "$id" "$frame" "$fullscreen" "$parent"
	done
}

plan_unzoom() {
	local id frame fullscreen parent

	while IFS=$'\t' read -r id frame fullscreen parent; do
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
	local -r focused_id=${1:-0}
	local windows rows focused_frame

	windows=$(yabai --message query --windows --space)
	rows=$(parse_windows <<<"$windows")
	focused_frame=$(frame_of "$focused_id" <<<"$rows")

	printf '%s\n' "$rows" |
		exclude_node "$focused_frame" |
		dedupe_nodes |
		plan_unzoom |
		apply_unzoom
}

main "$@"
