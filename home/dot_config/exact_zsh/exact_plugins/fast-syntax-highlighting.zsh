fast_syntax_highlighting_init() {
	# shellcheck disable=SC2154
	local key="${FAST_THEME_NAME}unknown-token"
	# shellcheck disable=SC2034,SC2004
	FAST_HIGHLIGHT_STYLES[$key]='fg=red'
}

zinit \
	wait \
	lucid \
	light-mode \
	atclone"git switch --detach ${PLUGIN_LOCK['fast-syntax-highlighting']}" \
	atpull'%atclone' \
	atload'fast_syntax_highlighting_init; unset -f fast_syntax_highlighting_init' \
	for zdharma-continuum/fast-syntax-highlighting
