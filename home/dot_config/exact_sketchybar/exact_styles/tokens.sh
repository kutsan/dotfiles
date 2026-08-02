#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2154

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

readonly style_spacing_1=4
readonly style_spacing_2=8
readonly style_spacing_3=12

readonly style_pill_padding="$style_spacing_3"

readonly pill_height=26
readonly pill_radius=13

readonly style_pill_properties=(
	background.color="$style_surface"
	background.corner_radius="$pill_radius"
	background.height="$pill_height"
)

readonly style_spacer_properties=(
	width="$style_spacing_1"
	icon.drawing=off
	label.drawing=off
	background.drawing=off
)
