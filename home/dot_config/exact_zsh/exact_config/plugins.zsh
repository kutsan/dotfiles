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
