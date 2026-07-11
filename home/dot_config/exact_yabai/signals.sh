#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

recover_focus='yabai --message query --windows --window &> /dev/null || yabai --message window --focus mouse'

yabai --message signal \
	--add event=window_destroyed action="$recover_focus"
yabai --message signal \
	--add event=application_terminated action="$recover_focus"
