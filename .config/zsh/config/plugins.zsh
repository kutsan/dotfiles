# Finish if there isn't a plugins directory.
if (! [[ -d "$ZDOTDIR/plugins/" ]]) {
	return 1
}

# zsh-autopair: Insert or delete brackets, parens, quotes in pair.
source "$ZDOTDIR/plugins/autopair/autopair.zsh"

# zsh-system-clipboard: Synchronize system clipboard with ZLE registers.
source "$ZDOTDIR/plugins/system-clipboard/zsh-system-clipboard.zsh"

# zsh-autosuggestions: Fish-like auto-suggestions.
source "$ZDOTDIR/plugins/autosuggestions/zsh-autosuggestions.zsh"
