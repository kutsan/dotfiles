#!/usr/bin/env zsh

# Redirect all output to log file.
exec &>> ~/.newsboat/log/$(basename $0).log

setopt ERR_EXIT PIPE_FAIL WARN_CREATE_GLOBAL WARN_NESTED_VAR

if ! (( $+commands[termux-notification] )) {
	echo "[$(date +'%Y-%m-%d %H:%M:%S')] termux-notification is not found."
	exit 1
}

termux-notification --title 'newsboat' --content "$@"
