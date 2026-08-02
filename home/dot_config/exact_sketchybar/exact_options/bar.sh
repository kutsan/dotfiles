#!/usr/bin/env bash
# shellcheck disable=SC2154,SC1091

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

source "$config_dir/styles/main.sh"

readonly bar_height=34
readonly bar_color=0x00000000

readonly bar_properties=(
	position=top
	height="$bar_height"
	padding_left="$style_spacing_3"
	padding_right="$style_spacing_3"
	color="$bar_color"
	blur_radius=0
	shadow=off
	sticky=on
)

sketchybar --bar "${bar_properties[@]}"
