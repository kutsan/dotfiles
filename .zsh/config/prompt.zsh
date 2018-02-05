# Initialize prompt system.
promptinit

# Prompt theme
prompt pure

# Prompt options
typeset -g PROMPT_CURRENT_SYMBOL="$PROMPT_INSERT_MODE_SYMBOL"
typeset -g PROMPT_INSERT_MODE_SYMBOL=''
typeset -g PROMPT_NORMAL_MODE_SYMBOL='▢'
typeset -g PROMPT_NORMAL_STATUS_COLOR='white'
typeset -g PROMPT_ERROR_STATUS_COLOR='red'

# Primary Prompt
PROMPT='%(?.%F{$PROMPT_NORMAL_STATUS_COLOR}.%F{$PROMPT_ERROR_STATUS_COLOR})${PROMPT_CURRENT_SYMBOL}%f '

# Spelling Correction Prompt
SPROMPT="zsh: correct %F{red}'%R'%f to %F{red}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "

# ZLE hooks for prompt's Vim mode status
function zle-line-init zle-keymap-select {
	# Change the cursor style depending on keymap mode.
	if [[ "$SSH_CONNECTION" == '' ]] {
		if [[ "$KEYMAP" =~ 'main|viins' ]] {
			printf '\033[6 q' # Vertical bar.
		} else {
			printf '\033[0 q' # Box.
		}
	}

	# Change the prompt symbol depending on keymap mode.
	PROMPT_CURRENT_SYMBOL=${${KEYMAP/vicmd/${PROMPT_NORMAL_MODE_SYMBOL}}/(main|viins)/${PROMPT_INSERT_MODE_SYMBOL}}

	# Redraw if necessary.
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
