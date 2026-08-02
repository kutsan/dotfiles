#!/usr/bin/env bash
# shellcheck disable=SC2154,SC1091

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

source "$config_dir/styles/main.sh"

readonly font_family='MonoLisa Variable'
readonly font_style='Regular'
readonly font_size=14.0

readonly font="$font_family:$font_style:$font_size"

readonly item_defaults=(
	icon.font="$font"
	icon.color="$style_content"
	icon.align=center
	label.font="$font"
	label.color="$style_content"
	label.align=center
)

sketchybar --default "${item_defaults[@]}"
