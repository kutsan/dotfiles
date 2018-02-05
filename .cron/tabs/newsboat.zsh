#!/usr/bin/env zsh

# Load environment variables.
source ~/.zsh/config/exports.zsh

# Reload feeds and that will launch notify-program if there are new feeds.
newsboat -x reload
