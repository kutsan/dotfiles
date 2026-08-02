#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

readonly item_name="${NAME:?}"

readonly pill_name="${item_name%%.*}"
readonly script_dir="${BASH_SOURCE[0]%/*}"

readonly lookahead_minutes=720 # 12 hours
readonly imminent_minutes=15
readonly next_event_script="$script_dir/next-event.swift"

# SF Symbols `calendar`. Part of the label rather than the icon slot, so the
# whole pill is one string and its glyph shares the label's color and highlight.
readonly calendar_icon='􀉉'

format_countdown() {
	local -r minutes=$1
	local -r minutes_per_day=1440

	if ((minutes <= 0)); then
		printf 'now'
	elif ((minutes < 60)); then
		printf 'in %dm' "$minutes"
	elif ((minutes < minutes_per_day)); then
		printf 'in %dh %02dm' "$((minutes / 60))" "$((minutes % 60))"
	else
		printf 'in %dd%dh' \
			"$((minutes / minutes_per_day))" \
			"$((minutes % minutes_per_day / 60))"
	fi
}

helper_status=0
event="$("$next_event_script" "$lookahead_minutes")" || helper_status=$?
readonly event helper_status

if ((helper_status != 0)); then
	sketchybar \
		--set "$item_name" drawing=off \
		--set "$pill_name" drawing=off
	exit 0
fi

IFS=$'\t' read -r minutes_until_start _ <<<"$event"
readonly minutes_until_start

countdown="$(format_countdown "$minutes_until_start")"
readonly countdown

readonly is_imminent=$((minutes_until_start <= imminent_minutes))

sketchybar \
	--set "$pill_name" drawing=on \
	--set "$item_name" \
	drawing=on \
	label="$calendar_icon $countdown" \
	label.highlight="$is_imminent"
