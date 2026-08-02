#!/usr/bin/env bash
# shellcheck disable=SC2154,SC1091

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

source "$config_dir/styles/main.sh"

target_position="${1:?}"
script_dir="${BASH_SOURCE[0]%/*}"

readonly spaces_icons=(1 2 3 4 5 6 7 8 9)

for index in "${!spaces_icons[@]}"; do
	space_id=$((index + 1))

	space_properties=(
		space="$space_id"
		icon="${spaces_icons[index]}"
		icon.color="$style_content_muted"
		icon.highlight_color="$style_accent"
		icon.padding_left="$style_spacing_2"
		icon.padding_right="$style_spacing_2"
		label.drawing=off
		script="$script_dir/update.sh"
		click_script="yabai --message space --focus $space_id"
	)

	sketchybar \
		--add space "spaces.$space_id" "$target_position" \
		--set "spaces.$space_id" "${space_properties[@]}"
done
