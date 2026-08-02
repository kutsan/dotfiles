#!/usr/bin/env bash
# shellcheck disable=SC2154,SC1091

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

source "$config_dir/styles/main.sh"

script_dir="${BASH_SOURCE[0]%/*}"

readonly position_before_notch=q
readonly position_after_notch=e
# shellcheck disable=SC2034
readonly position_center=center

readonly center_spacer_properties=(
	width="$((style_spacing_1 / 2))"
	icon.drawing=off
	label.drawing=off
	background.drawing=off
)

sketchybar \
	--add item spacer.center_left "$position_before_notch" \
	--set spacer.center_left "${center_spacer_properties[@]}"

(source "$script_dir/calendar/item.sh" "$position_before_notch")

sketchybar \
	--add bracket calendar '/calendar\..*/' \
	--set calendar "${style_pill_properties[@]}"

sketchybar \
	--add item spacer.center_right "$position_after_notch" \
	--set spacer.center_right "${center_spacer_properties[@]}"

(source "$script_dir/battery/item.sh" "$position_after_notch")

sketchybar \
	--add bracket battery '/battery\..*/' \
	--set battery "${style_pill_properties[@]}"
