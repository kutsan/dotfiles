#!/usr/bin/env bash
# shellcheck disable=SC2154,SC1091

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

source "$config_dir/styles/main.sh"

target_position="${1:?}"
script_dir="${BASH_SOURCE[0]%/*}"

sketchybar \
	--add item spacer "$target_position" \
	--set spacer "${style_spacer_properties[@]}"

(source "$script_dir/battery/item.sh" "$target_position")

sketchybar \
	--add bracket battery '/battery\..*/' \
	--set battery "${style_pill_properties[@]}"
