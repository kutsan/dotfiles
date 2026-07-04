#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

fetch_frontmost_app() {
	local path
	path=$(osascript -e 'POSIX path of (path to frontmost application)')
	basename "$path" .app
}

fetch_encoded_browser_tab_url() {
	local -r browser=$1

	case $browser in
	Safari)
		osascript -l JavaScript -e '
			const tab = Application("Safari").windows[0].currentTab
			encodeURIComponent(tab.url())
		'
		;;
	'Google Chrome')
		osascript -l JavaScript -e '
			const tab = Application("Google Chrome").windows[0].activeTab
			encodeURIComponent(tab.url())
		'
		;;
	*)
		printf 'unsupported browser: %s\n' "$browser" >&2
		return 1
		;;
	esac
}

open_goodlinks_save() {
	local -r encoded_url=$1
	open "goodlinks://x-callback-url/save?url=${encoded_url}"
}

main() {
	local browser
	browser=$(fetch_frontmost_app)

	local encoded_url
	encoded_url=$(fetch_encoded_browser_tab_url "$browser")

	open_goodlinks_save "$encoded_url"
}

main "$@"
