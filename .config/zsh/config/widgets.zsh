# Register functions as widgets.
foreach widget (
	# Built-in
	'add-surround surround'
	'delete-surround surround'
	'change-surround surround'
	select-quoted
	select-bracketed

	# Custom
	custom-expand-global-alias
	custom-insert-last-typed-word
	custom-tmux-scroll-up
	custom-fzf-launch-from-history
	custom-fzf-select
) {
	eval zle -N $widget
}
unset widget

# Expand global alias to its full form.
function custom-expand-global-alias() {
	if [[ "$LBUFFER" =~ ' [A-Z0-9]+$' ]] {
		zle _expand_alias
	}

	zle self-insert
}

# Insert last typed word for quick copy-paste.
function custom-insert-last-typed-word() {
	zle insert-last-word -- 0 -1
}

# Activate tmux copy-mode and scroll up depending on key stroke.
function custom-tmux-scroll-up() {
	if (! (( $+commands[tmux] )) || [[ "$TMUX" == '' ]]) {
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

# Select command from history into the command line.
function custom-fzf-launch-from-history() {
	if ! (( $+commands[fzf] )) {
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
				--exact
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

	typeset -f zle-line-init &>/dev/null && zle zle-line-init

	return $stat
}

# Paste the selected files and directories into the command-line.
function custom-fzf-select() {
	if ! (( $+commands[fzf] )) {
		return 1
	}

	local directory=${${(ps: :)LBUFFER}[-1]}
	(! [[ -d "$directory" ]]) && unset directory

	local selected=$(
		find -L ${directory:-'.'} \( -fstype 'dev' -or -fstype 'proc' \) -prune -or -print 2>/dev/null \
		| sed 1d \
		| ([[ -v directory ]] && cat || cut --bytes=3-) \
		| fzf \
			--preview-window='right:60%' \
			--preview=' \
				if [ -d {} ]; then; \
					ls -l --si --almost-all --classify --color=always --group-directories-first --literal {} 2>/dev/null; \
				else \
					cat {} 2>/dev/null; \
				fi \
			' \
	)

	if [[ "$selected" != '' ]] {
		LBUFFER="${LBUFFER//${directory:-}/}${selected}"
	}

	zle redisplay
}
