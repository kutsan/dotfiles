#!/usr/bin/env bash

# Enable debugging mode to see what commands executed on execution.
set -x

# -- Global {{{1
# --------------------------------------------------------------------------------------------------

# Show all files everywhere, even in open dialog.
defaults write -g AppleShowAllFiles -bool true

# Don't write `.DS_Store` files to portable devices.
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# -- Dock {{{1
# --------------------------------------------------------------------------------------------------

# Fully resize Dock's body.
defaults write com.apple.dock tilesize -int 39

killall Dock

# }}} vim: foldmethod=marker foldlevel=0
