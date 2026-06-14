# shellcheck disable=SC2034
pure_init() {
	typeset -g PURE_PROMPT_SYMBOL='❯'
	typeset -g PURE_PROMPT_VICMD_SYMBOL='❯'

	zstyle ':prompt:pure:git:stash' show yes
	zstyle ':prompt:pure:prompt:error' color 1
	zstyle ':prompt:pure:prompt:success' color 15
}

zinit \
	light-mode \
	atclone"git switch --detach ${PLUGIN_LOCK[pure]}" \
	atpull'%atclone' \
	atinit'pure_init' \
	atload'unset -f pure_init' \
	pick'async.zsh' \
	src'pure.zsh' \
	for sindresorhus/pure
