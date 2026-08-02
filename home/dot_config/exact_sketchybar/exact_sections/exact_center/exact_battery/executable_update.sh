#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

readonly item_name="${NAME:?}"
readonly pill_name="${item_name%%.*}"

readonly visible_below=60
readonly critical_below=40

readonly icon_charging='􀋦'
readonly icon_full='􀛨'
readonly icon_high='􀺸'
readonly icon_medium='􀺶'
readonly icon_low='􀛩'
readonly icon_empty='􀛪'

battery_report="$(pmset -g batt)"
readonly battery_report

percentage="$(printf '%s\n' "$battery_report" | grep -Eo '[0-9]+%' | cut -d% -f1 || true)"
readonly percentage

if [[ -z "$percentage" ]] || ((percentage >= visible_below)); then
	sketchybar \
		--set "$item_name" drawing=off \
		--set "$pill_name" drawing=off
	exit 0
fi

if printf '%s\n' "$battery_report" | grep -q 'AC Power'; then
	readonly icon="$icon_charging"
else
	case "$percentage" in
	9[0-9] | 100)
		readonly icon="$icon_full"
		;;
	[6-8][0-9])
		readonly icon="$icon_high"
		;;
	[4-5][0-9])
		readonly icon="$icon_medium"
		;;
	[2-3][0-9])
		readonly icon="$icon_low"
		;;
	*)
		readonly icon="$icon_empty"
		;;
	esac
fi

readonly is_critical=$((percentage < critical_below))

sketchybar \
	--set "$pill_name" drawing=on \
	--set "$item_name" \
	drawing=on \
	icon="$icon" \
	icon.highlight="$is_critical" \
	label="${percentage}%" \
	label.highlight="$is_critical"
