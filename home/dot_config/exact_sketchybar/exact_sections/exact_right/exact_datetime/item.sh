#!/usr/bin/env bash
# shellcheck disable=SC2154,SC1091

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

source "$config_dir/styles/main.sh"

target_position="${1:?}"
script_dir="${BASH_SOURCE[0]%/*}"

readonly datetime_update_freq=10

readonly datetime_properties=(
	icon.drawing=off
	label.color="$style_content"
	label.padding_left="$style_pill_padding"
	label.padding_right="$style_pill_padding"
	update_freq="$datetime_update_freq"
	script="$script_dir/update.sh"
)

sketchybar \
	--add item datetime.now "$target_position" \
	--set datetime.now "${datetime_properties[@]}"
