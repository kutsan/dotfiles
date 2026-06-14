fast_syntax_highlighting_init() {
	FAST_HIGHLIGHT_STYLES[${FAST_THEME_NAME}unknown-token]='fg=red'
}

zinit \
	wait \
	lucid \
	light-mode \
	atclone"git switch --detach ${PLUGIN_LOCK[fast-syntax-highlighting]}" \
	atpull'%atclone' \
	atload'fast_syntax_highlighting_init; unfunction fast_syntax_highlighting_init' \
	for zdharma-continuum/fast-syntax-highlighting
