#!/usr/bin/env bash
# shellcheck disable=SC2154,SC1091

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

source "$config_dir/styles/main.sh"

target_position="${1:?}"
script_dir="${BASH_SOURCE[0]%/*}"

readonly calendar_update_freq=60

readonly calendar_icon='􀉉'

readonly calendar_properties=(
	drawing=off
	icon="$calendar_icon"
	icon.color="$style_content"
	icon.highlight_color="$style_critical"
	icon.padding_left="$style_pill_padding"
	icon.padding_right="$style_spacing_1"
	label.color="$style_content"
	label.highlight_color="$style_critical"
	label.padding_right="$style_pill_padding"
	update_freq="$calendar_update_freq"
	script="$script_dir/update.sh"
)

sketchybar \
	--add item calendar.next "$target_position" \
	--set calendar.next "${calendar_properties[@]}"
