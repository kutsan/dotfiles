##
# Get commit hashes using:
#
# ```sh
# for d in $ZINIT[PLUGINS_DIR]/*(/); [[ -d $d/.git ]] && { u=$(git -C $d remote get-url origin); echo "${${u#https://github.com/}%.git}: \"$(git -C $d rev-parse HEAD)\"" }
# ```
##

# pure: A minimal prompt asy Git and async support.
zinit ice ver'54bd501c802283dee0940457da6eb3e642bd1453' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# atuin: Shell history integration.
zinit ice as"command" from"gh-r" bpick"atuin-*.tar.gz" mv"atuin*/atuin -> atuin" \
	atclone"./atuin init zsh > init.zsh; ./atuin gen-completions --shell zsh > _atuin" \
	atpull"%atclone" src"init.zsh"
zinit light atuinsh/atuin

# zsh-autosuggestions: Fish-like auto-suggestions.
zinit ice ver'85919cd1ffa7d2d5412f6d3fe437ebdbeeec4fc5'
zinit light zsh-users/zsh-autosuggestions

# zsh-autopair: Insert or delete brackets, parens, quotes in pair.
zinit wait lucid \
	ver'449a7c3d095bc8f3d78cf37b9549f8bb4c383f3d' \
	for light-mode hlissner/zsh-autopair

# zsh-system-clipboard: Synchronize system clipboard with ZLE registers.
zinit wait lucid \
	ver'5f1d497ee3c215a967c0e6b9a772e73c40332d52' \
	for light-mode kutsan/zsh-system-clipboard

# fast-syntax-highlighting: Syntax highlighting support.
zinit wait lucid \
	ver'3d574ccf48804b10dca52625df13da5edae7f553' \
	atload"FAST_HIGHLIGHT_STYLES[\${FAST_THEME_NAME}unknown-token]='fg=red'" \
	for light-mode zdharma-continuum/fast-syntax-highlighting
