#!/usr/bin/env zsh

##
# Toggle two pane between them.
#
# USAGE
#   bind -n <key> run-shell "~/.tmux/functions/toggle-pane.tmux"
##

if (( $(tmux display-message -p '#{window_panes}') > 1 )) {
	# If zoom active
	if [[ $(tmux display-message -p '#{window_zoomed_flag}') == '1' ]] {
		tmux resize -Z
		tmux last-pane

	} else {
		tmux last-pane
		tmux resize -Z
	}

} else {
	tmux split-window -h -l 60 -c "#{pane_current_path}"
}
