#!/usr/bin/env zsh

# Redirect all output to log file.
exec &>> ~/.newsboat/logs/$(basename $0).log

setopt ERR_EXIT PIPE_FAIL WARN_CREATE_GLOBAL WARN_NESTED_VAR

if ! (( $+commands[notify] )) {
	echo "[$(date +'%Y-%m-%d %H:%M:%S')] notify is not installed yet."
	exit 1
}

notify --title 'newsboat' --message "$@"
