pure_init() {
	typeset -g PURE_PROMPT_SYMBOL='❯'
	typeset -g PURE_PROMPT_VICMD_SYMBOL='❯'

	zstyle ':prompt:pure:git:stash' show yes
	zstyle ':prompt:pure:prompt:error' color 1
	zstyle ':prompt:pure:prompt:success' color 15
}

zinit ice \
	atclone"git switch --detach ${PLUGIN_LOCK[pure]}" \
	atpull'%atclone' \
	atinit'pure_init' \
	atload'unfunction pure_init' \
	pick'async.zsh' \
	src'pure.zsh'
zinit light sindresorhus/pure
