#!/usr/bin/env zsh

if (hash notify &>/dev/null) {
	notify \
		--title 'newsboat' \
		--message "$@" \
		--icon 'https://i.imgur.com/hDbLUpK.png'
}
