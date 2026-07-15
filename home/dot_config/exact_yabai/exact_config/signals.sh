#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

readonly scripts_dir="${BASH_SOURCE[0]%/config/*}/scripts"

readonly recover_focus='yabai --message query --windows --window &> /dev/null || yabai --message window --focus mouse'

yabai --message signal \
	--add event=window_destroyed action="$recover_focus"
yabai --message signal \
	--add event=application_terminated action="$recover_focus"

yabai --message signal \
	--add event=window_focused \
	action="$scripts_dir/auto-unzoom.sh \$YABAI_WINDOW_ID"
