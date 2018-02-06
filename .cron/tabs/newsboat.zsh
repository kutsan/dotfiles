#!/usr/bin/env zsh

# Load environment variables.
source ~/.zsh/config/exports.zsh

# Load utility functions for logging.
source ~/.zsh/lib/console.zsh

# Redirect all output to log file.
exec &>> $CRONTAB_HOME/logs/$(basename $0).log

# Log with date to indicate it's running in success.
console.info --with-date "Running."

# Reload feeds and that will launch notify-program if there are new feeds.
newsboat -x reload
