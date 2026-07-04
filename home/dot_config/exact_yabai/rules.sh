#!/usr/bin/env bash

unmanaged_apps=(
	'System Settings'
	'Activity Monitor'
	'Calculator'
	'Dictionary'
	'Disk Utility'
	'QuickTime Player'
	'FaceTime'
	'iD'
)

unmanaged_windows=(
	'Google Chrome' 'Meet - '
)

for app in "${unmanaged_apps[@]}"; do
	yabai --message rule --add app="^$app\$" manage=off
done

for ((i = 0; i < ${#unmanaged_windows[@]}; i += 2)); do
	app=${unmanaged_windows[i]}
	title=${unmanaged_windows[i + 1]}

	yabai --message rule --add app="^$app\$" title="^$title" manage=off
done
