#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Standard positions (mirror skhd float-snap vocabulary)
readonly grid_base="12:12"
readonly center="$grid_base:2:1:8:10"
readonly left_half="$grid_base:1:1:5:10"

yabai --message rule --add manage=off grid="$center" \
	app="^(System Settings|Activity Monitor|Disk Utility)$"
yabai --message rule --add manage=off grid="$center" \
	app="^(Calculator|Dictionary)$"
yabai --message rule --add manage=off grid="$center" \
	app="^(QuickTime Player|FaceTime)$"

yabai --message rule --add manage=off grid="$center" \
	app="^(Mail|Notes)$"
yabai --message rule --add manage=off grid="$left_half" \
	app="^Reminders$"
yabai --message rule --add manage=off grid="$center" \
	app="^Home$"

yabai --message rule --add manage=off grid="$center" \
	app="^iD$"

yabai --message rule --add manage=off grid="$center" space=9 \
	app="^Slack$"

yabai --message rule --add manage=off \
	app="^Google Chrome$" title="^Meet - "

yabai --message rule --apply
