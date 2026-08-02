#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

readonly space_padding=10
readonly window_gap=8
readonly external_bar_padding=30

yabai --message config \
	layout bsp \
	window_placement second_child \
	external_bar all:$((external_bar_padding - window_gap / 2)):0

yabai --message config \
	top_padding "$space_padding" \
	bottom_padding "$space_padding" \
	left_padding "$space_padding" \
	right_padding "$space_padding" \
	window_gap "$window_gap"
