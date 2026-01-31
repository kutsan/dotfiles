# zsh-autosuggestions: Fish-like auto-suggestions.
zinit light zsh-users/zsh-autosuggestions

# zsh-autopair: Insert or delete brackets, parens, quotes in pair.
zinit wait lucid for light-mode hlissner/zsh-autopair

# zsh-system-clipboard: Synchronize system clipboard with ZLE registers.
zinit wait lucid for light-mode kutsan/zsh-system-clipboard

# fast-syntax-highlighting: Syntax highlighting support.
zinit wait lucid \
	atload"FAST_HIGHLIGHT_STYLES[\${FAST_THEME_NAME}unknown-token]='fg=red'" \
	for light-mode zdharma-continuum/fast-syntax-highlighting

# Auto-update plugins once per week.
function _zinit_autoupdate() {
	zmodload -F zsh/datetime +p:EPOCHSECONDS

	local update_file="$XDG_CACHE_HOME/zinit/zinit-last-update"
	local last_update=0

	if ([[ -f "$update_file" ]]) {
		last_update=$(<"$update_file")
	}

	# Update if more than 7 days have passed since last update.
	if (( EPOCHSECONDS - last_update > 60 * 60 * 24 * 7 )) {
		echo "$EPOCHSECONDS" >! "$update_file"
		zinit update --all --no-pager
	}
}
_zinit_autoupdate
unfunction _zinit_autoupdate
