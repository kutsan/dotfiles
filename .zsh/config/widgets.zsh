# Register functions as widgets.
foreach widget (
	custom-expand-global-alias
	custom-add-noglob-before-the-command
	custom-add-sudo-before-the-command
	custom-insert-last-typed-word
	custom-tmux-show-man-current-command
	custom-tmux-scroll-up
	custom-tmux-jump-back-prompt
	custom-fzf-launch-from-history
	custom-fzf-execute-widget
) {
	zle -N $widget
}
unset widget

# Expand global alias to its full form.
function custom-expand-global-alias() {
	if [[ "$LBUFFER" =~ ' [A-Z0-9]+$' ]] {
		zle _expand_alias
	}

	zle self-insert
}

# Insert noglob before the command.
function custom-add-noglob-before-the-command() {
	if [[ "$BUFFER" != *'noglob '* ]] {
		BUFFER="noglob $BUFFER"
		CURSOR=$#BUFFER
	} else {
		BUFFER=${BUFFER/noglob /}
	}
}

# Insert sudo before the command.
function custom-add-sudo-before-the-command() {
	if [[ "$BUFFER" != *'sudo '* ]] {
		BUFFER="sudo $BUFFER"
		CURSOR=$#BUFFER
	} else {
		BUFFER=${BUFFER/sudo /}
	}
}

# Insert last typed word for quick copy-paste.
function custom-insert-last-typed-word() {
	zle insert-last-word -- 0 -1
}

# Show split pane man page for written command.
function custom-tmux-show-man-current-command() {
	if (! hash tmux &>/dev/null || [[ "$TMUX" == '' ]] || [[ "$BUFFER" == '' ]]) {
		return 1
	}

	tmux new-window
	tmux send-keys "man ${${BUFFER//(sudo |noglob |command |builtin |nocorrect |exec )/}%% *}" "Enter"
}

# Activate tmux copy-mode and scroll up depending on key stroke.
function custom-tmux-scroll-up() {
	if (! hash tmux &>/dev/null || [[ "$TMUX" == '' ]]) {
		return 1
	}

	tmux copy-mode

	# "$KEYS" == ^Y
	if [[ "$KEYS" ==  ]] {
		tmux send-keys -X scroll-up

	# "$KEYS" == ^Y
	} elif [[ "$KEYS" ==  ]] {
		tmux send-keys -X halfpage-up
	}
}

# Jump back to last prompt.
function custom-tmux-jump-back-prompt() {
	if (! hash tmux &>/dev/null || [[ "$TMUX" == '' ]]) {
		return 1
	}

	tmux \
		copy-mode \; \
		send-keys -X search-backward "$PROMPT_INSERT_MODE_SYMBOL"
}

# Select command from history into the command line.
function custom-fzf-launch-from-history() {
	if (! hash fzf &>/dev/null) {
		return 1
	}

	setopt LOCAL_OPTIONS NO_GLOB_SUBST NO_POSIX_BUILTINS PIPE_FAIL 2>/dev/null

	local selected=(
		$(
			fc -l 1 \
				| fzf \
					--tac \
					--nth='2..,..' \
					--tiebreak='index' \
					--query="${LBUFFER}" \
					--exact \
					--prompt='$ '
		)
	)

	local stat=$?

	if [[ "$selected" != '' ]] {
		local num=$selected[1]

		if [[ "$num" != '' ]] {
			zle vi-fetch-history -n $num
		}
	}

	zle redisplay
	typeset -f zle-line-init >/dev/null && zle zle-line-init

	return $stat
}

# Execute Zsh Line Editor widgets.
function custom-fzf-execute-widget() {
	if (! hash fzf &>/dev/null) {
		return 1
	}

	local selected=$(
		zle -al \
			| command grep --extended-regexp --invert-match '(orig|^\.|^_)' \
			| fzf \
				--tac \
				--nth='2..,..' \
				--tiebreak='index' \
				--prompt=':'
	)

	local stat=$?

	if [[ "$selected" != '' ]] {
		zle $selected
	}

	return $stat
}
