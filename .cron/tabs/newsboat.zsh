#!/usr/bin/env zsh

# Redirect all output to log file.
exec &>> ~/.cron/logs/$(basename $0).log

setopt ERR_EXIT PIPE_FAIL WARN_CREATE_GLOBAL WARN_NESTED_VAR

# Import environment variables.
source ~/.zsh/config/exports.zsh

# Import utility functions for logging.
source ~/.zsh/lib/console.zsh

# Log with date to indicate it's running in success.
console.info --with-date 'Running.'

if (! hash newsboat &>/dev/null) {
	console.error --with-date "Unable to find ${bold_color}newsboat${reset_color} on \$PATH or it is not installed yet."
	exit 1
}

# Reload feeds and that will launch notify-program if there are new feeds.
newsboat -x reload
