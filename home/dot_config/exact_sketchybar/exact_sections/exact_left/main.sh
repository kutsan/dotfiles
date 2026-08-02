#!/usr/bin/env bash
# shellcheck disable=SC2154,SC1091

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

source "$config_dir/styles/main.sh"

target_position="${1:?}"
script_dir="${BASH_SOURCE[0]%/*}"

readonly inset_width=$((style_pill_padding > style_spacing_2 ? style_pill_padding - style_spacing_2 : 0))

readonly inset_properties=(
	width="$inset_width"
	icon.drawing=off
	label.drawing=off
)

sketchybar \
	--add item spaces.inset_left "$target_position" \
	--set spaces.inset_left "${inset_properties[@]}"

(source "$script_dir/spaces/item.sh" "$target_position")

sketchybar \
	--add item spaces.inset_right "$target_position" \
	--set spaces.inset_right "${inset_properties[@]}"

sketchybar \
	--add bracket spaces '/spaces\..*/' \
	--set spaces "${style_pill_properties[@]}"
