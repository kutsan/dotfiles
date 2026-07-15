#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

# Standard positions (mirror `skhd` float-snap vocabulary)
readonly grid_base="12:12"
readonly center="$grid_base:2:1:8:10"
readonly right_half="$grid_base:6:1:5:10"

yabai --message rule --add manage=off grid="$center" \
	app="^(System Settings|Activity Monitor|Disk Utility)$"
yabai --message rule --add manage=off grid="$center" \
	app="^(Calculator|Dictionary)$"
yabai --message rule --add manage=off grid="$center" \
	app="^(QuickTime Player|FaceTime)$"
yabai --message rule --add manage=off grid="$center" \
	app="^(Mail|Notes|Home)$"
yabai --message rule --add manage=off grid="$right_half" \
	app="^Reminders$"

yabai --message rule --add manage=off grid="$center" \
	app="^(IINA|HandBrake|HomePass)$"
yabai --message rule --add manage=off grid="$center" \
	app="^(Backblaze|Pearcleaner|Parachute|Blackmagic Disk Speed Test)$"
yabai --message rule --add manage=off grid="$center" \
	app="^(Docker Desktop|Transmission|Hyperduck|Codepoint)$"
yabai --message rule --add manage=off grid="$center" \
	app="^(iD|Insta360 Link Controller|Ukelele)$"
yabai --message rule --add manage=off grid="$center" \
	app="^(WireGuard|Ledger Live)$"

yabai --message rule --add manage=off grid="$center" \
	app="^(Slack|Discord|WhatsApp)$"

yabai --message rule --add manage=off \
	app="^Google Chrome$" title="^Meet - "

yabai --message rule --apply
