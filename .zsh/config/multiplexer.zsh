# Auto-attach tmux or start at launch with different sessions based on platforms.
if (
	hash tmux 2>/dev/null \
	&& [[ $TMUX == '' ]] \
	&& [[ $SUDO_USER == '' ]] \
	&& [[ $EMACS == '' ]] \
	&& [[ $VIM == '' ]] \
	&& [[ $SSH_CONNECTION == '' ]] \
	&& [[ $(uname -o) != 'Android' ]] 2>/dev/null
) {
	typeset -g session=''

	# VSCode integrated terminal
	if [[ $VSCODE_PID != '' ]] {
		session='vscode'

	# Terminal emulator
	} else {
		session='main'
	}

	tmux attach-session -t "$session" \
		|| tmux -f "$HOME/.tmux/tmux.conf" new -s "$session" && exit 0

	unset session
}
