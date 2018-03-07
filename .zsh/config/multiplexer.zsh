function should_launch_multiplexer() {
	if (! hash tmux 2>/dev/null) {
		return 1
	}

	if [[ $NVIM_LISTEN_ADDRESS != '' ]] {
		return 0
	} elif (
		[[ $TMUX == '' ]] \
		&& [[ $SUDO_USER == '' ]] \
		&& [[ $EMACS == '' ]] \
		&& [[ $SSH_CONNECTION == '' ]] \
		&& [[ $(uname -o) != 'Android' ]] 2>/dev/null
	) {
		return 0
	}

	return 1
}

# Auto-attach tmux or start at launch with different sessions based on platforms.
if (should_launch_multiplexer) {
	typeset -g session='main'
	typeset -g launch_options=''

	if [[ $VSCODE_PID != '' ]] {
		session='vscode'

	} elif [[ $NVIM_LISTEN_ADDRESS != '' ]] {
		session='nvim'
		launch_options='\; set-option -w status off'
	}

	tmux attach-session -t "$session" 2>/dev/null \
		|| eval tmux -f "$HOME/.tmux/tmux.conf" new-session -s "$session" $launch_options \
		&& exit 0

	unset session
	unset launch_options
}

unset -f should_launch_multiplexer
