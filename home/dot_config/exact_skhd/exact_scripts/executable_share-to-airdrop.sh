#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
readonly SCRIPT_DIR
readonly AIRDROP_HELPER=$SCRIPT_DIR/airdrop-url.swift

fetch_frontmost_app() {
	local path
	path=$(osascript -e 'POSIX path of (path to frontmost application)')
	basename "$path" .app
}

fetch_url_from_app() {
	local -r app=$1
	osascript -e "tell application \"$app\" to URL of current tab of front window" 2>/dev/null ||
		osascript -e "tell application \"$app\" to URL of active tab of front window" 2>/dev/null
}

main() {
	local app url

	app=$(fetch_frontmost_app)
	url=$(fetch_url_from_app "$app") || {
		printf 'no URL from %s\n' "$app" >&2
		return 1
	}

	"$AIRDROP_HELPER" "$url"
}

main "$@"
