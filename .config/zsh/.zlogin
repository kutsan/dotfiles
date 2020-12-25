# Auto-attach tmux or start at launch with different sessions based on platforms.
if ( \
	(( $+commands[tmux] )) \
	&& ( \
		[[ $NVIM_LISTEN_ADDRESS != '' ]] \
		|| ([[ $TMUX == '' ]] && [[ $SUDO_USER == '' ]] && [[ $SSH_CONNECTION == '' ]]) \
	)
) {
	if [[ $NVIM_LISTEN_ADDRESS != '' ]] {
		typeset -g session='nvim'
		typeset -g launch_options='\; set-option -w status-position bottom \; set-option -w prefix C-s'
	}

	tmux attach-session -t ${session:-'main'} 2>/dev/null \
		&& exit 0

	eval tmux new-session -s "${session:-'main'}" ${launch_options:-''} \
		&& exit 0

	unset session
	unset launch_options
}

# Asynchronously zcompile .zcompdump file.
{
	typeset -g zcompdump="$HOME/.local/share/zsh/zcompdump"

	if ([[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]) {
		zcompile "$zcompdump"
	}
} &!
