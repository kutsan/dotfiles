# Finish if there isn't a plugins directory.
if ! [[ -d "$ZDOTDIR/plugins/" ]] {
	return 1
}

# zsh-autopair: Insert or delete brackets, parens, quotes in pair.
source "$ZDOTDIR/plugins/autopair/autopair.zsh"

# zsh-system-clipboard: Synchronize system clipboard with ZLE registers.
source "$ZDOTDIR/plugins/system-clipboard/zsh-system-clipboard.zsh"
	typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'

# zsh-autosuggestions: Fish-like auto-suggestions.
source "$ZDOTDIR/plugins/autosuggestions/zsh-autosuggestions.zsh"
	typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
	typeset -g ZSH_AUTOSUGGEST_ORIGINAL_WIDGET_PREFIX='autosuggest-orig-'
	typeset -ga ZSH_AUTOSUGGEST_STRATEGY=('history')
	typeset -ga ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(
		history-search-forward
		history-search-backward
		history-beginning-search-forward
		history-beginning-search-backward
		history-substring-search-up
		history-substring-search-down
		up-line-or-beginning-search
		down-line-or-beginning-search
		up-line-or-history
		down-line-or-history
		accept-line
	)
	typeset -ga ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
		vi-forward-char
	)
	typeset -ga ZSH_AUTOSUGGEST_EXECUTE_WIDGETS=()
	typeset -ga ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
		vi-forward-word
	)
	typeset -ga ZSH_AUTOSUGGEST_IGNORE_WIDGETS=(
		orig-\*
		beep
		run-help
		set-local-history
		which-command
		yank
		yank-pop
	)

# zsh-syntax-highlighting: Syntax highlighting support.
source "$ZDOTDIR/plugins/syntax-highlighting/zsh-syntax-highlighting.zsh"
	typeset -ga ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
	typeset -gA ZSH_HIGHLIGHT_STYLES

	# main
	ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
	ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,underline'
	ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[command]='fg=green'
	ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,underline'
	ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green,italic'
	ZSH_HIGHLIGHT_STYLES[path]='fg=magenta'
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=magenta'
	ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
	ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='none'
	ZSH_HIGHLIGHT_STYLES[globbing]='bg=black'
	ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='none'
	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='none'
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=magenta'
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=blue'
	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=blue'
	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=blue'
	ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=blue'
	ZSH_HIGHLIGHT_STYLES[assign]='none,underline'
	ZSH_HIGHLIGHT_STYLES[redirection]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[comment]='fg=black'
	ZSH_HIGHLIGHT_STYLES[arg0]='default'

	# brackets
	ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='bg=black'
