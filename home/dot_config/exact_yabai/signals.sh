#!/usr/bin/env bash

focus_window='yabai --message query --windows --window &> /dev/null || yabai --message window --focus mouse'

yabai --message signal \
	--add event=window_destroyed action="$focus_window"
yabai --message signal \
	--add event=application_terminated action="$focus_window"
