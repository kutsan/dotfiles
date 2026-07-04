#!/usr/bin/env bash

yabai --message config \
	layout bsp \
	window_placement second_child

readonly padding=10
readonly gap=8

yabai --message config \
	top_padding "$padding" \
	bottom_padding "$padding" \
	left_padding "$padding" \
	right_padding "$padding" \
	window_gap "$gap"
