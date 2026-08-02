#!/usr/bin/env bash
# shellcheck disable=SC2154,SC1091

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

source "$config_dir/styles/main.sh"

target_position="${1:?}"
script_dir="${BASH_SOURCE[0]%/*}"

readonly calendar_update_freq=60

# Glyph and countdown are one label, built by `update.sh`, so the icon slot goes
# unused rather than holding half the content.
readonly calendar_properties=(
	drawing=off
	icon.drawing=off
	label.color="$style_content"
	label.highlight_color="$style_critical"
	label.padding_left="$style_pill_padding"
	label.padding_right="$style_pill_padding"
	update_freq="$calendar_update_freq"
	script="$script_dir/update.sh"
)

sketchybar \
	--add item calendar.next "$target_position" \
	--set calendar.next "${calendar_properties[@]}"
