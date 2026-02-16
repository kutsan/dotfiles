# pure: A minimal prompt asy Git and async support.
zinit ice ver'dbefd0d' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# atuin: Shell history integration.
zinit ice as"command" from"gh-r" bpick"atuin-*.tar.gz" mv"atuin*/atuin -> atuin" \
	atclone"./atuin init zsh > init.zsh; ./atuin gen-completions --shell zsh > _atuin" \
	atpull"%atclone" src"init.zsh"
zinit light atuinsh/atuin

# zsh-autosuggestions: Fish-like auto-suggestions.
zinit ice ver'85919cd'
zinit light zsh-users/zsh-autosuggestions

# zsh-autopair: Insert or delete brackets, parens, quotes in pair.
zinit wait lucid \
	ver'449a7c3' \
	for light-mode hlissner/zsh-autopair

# zsh-system-clipboard: Synchronize system clipboard with ZLE registers.
zinit wait lucid \
	ver'5f1d497' \
	for light-mode kutsan/zsh-system-clipboard

# fast-syntax-highlighting: Syntax highlighting support.
zinit wait lucid \
	ver'3d574cc' \
	atload"FAST_HIGHLIGHT_STYLES[\${FAST_THEME_NAME}unknown-token]='fg=red'" \
	for light-mode zdharma-continuum/fast-syntax-highlighting
