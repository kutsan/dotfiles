fast_syntax_highlighting_init() {
	FAST_HIGHLIGHT_STYLES[${FAST_THEME_NAME}unknown-token]='fg=red'
}

zinit ice \
	wait \
	lucid \
	atclone"git switch --detach ${PLUGIN_LOCK[fast-syntax-highlighting]}" \
	atpull'%atclone' \
	atload'fast_syntax_highlighting_init; unfunction fast_syntax_highlighting_init'
zinit light zdharma-continuum/fast-syntax-highlighting
