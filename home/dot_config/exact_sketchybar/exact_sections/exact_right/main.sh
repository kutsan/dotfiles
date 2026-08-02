#!/usr/bin/env bash
# shellcheck disable=SC2154,SC1091

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

source "$config_dir/styles/main.sh"

target_position="right"
script_dir="${BASH_SOURCE[0]%/*}"

(source "$script_dir/datetime/item.sh" "$target_position")

sketchybar \
	--add bracket datetime '/datetime\..*/' \
	--set datetime "${style_pill_properties[@]}"
