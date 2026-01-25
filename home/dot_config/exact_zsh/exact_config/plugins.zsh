# Finish if there isn't a plugins directory.
if (! [[ -d "$XDG_DATA_HOME/zsh/plugins/" ]]) {
	return 1
}

# zsh-autopair: Insert or delete brackets, parens, quotes in pair.
source "$XDG_DATA_HOME/zsh/plugins/autopair/autopair.zsh"

# zsh-system-clipboard: Synchronize system clipboard with ZLE registers.
source "$XDG_DATA_HOME/zsh/plugins/system-clipboard/zsh-system-clipboard.zsh"

# zsh-autosuggestions: Fish-like auto-suggestions.
source "$XDG_DATA_HOME/zsh/plugins/autosuggestions/zsh-autosuggestions.zsh"

# fast-syntax-highlighting: Syntax highlighting support.
source "$XDG_DATA_HOME/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
	FAST_HIGHLIGHT_STYLES[${FAST_THEME_NAME}unknown-token]='fg=red'
