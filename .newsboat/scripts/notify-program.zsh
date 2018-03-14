#!/usr/bin/env zsh

# Redirect all output to log file.
exec &>> ~/.newsboat/logs/$(basename $0).log

setopt ERR_EXIT PIPE_FAIL WARN_CREATE_GLOBAL WARN_NESTED_VAR

# Import utility functions for logging.
source ~/.zsh/lib/console.zsh

if (! hash notify &>/dev/null) {
	console.error --with-date "${bold_color}notify${reset_color} is not installed yet."
	exit 1
}

notify --title 'newsboat' --message "$@"
