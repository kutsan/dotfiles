# zinit: Plugin manager. Installation is managed by chezmoi external sources.
ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
source "$ZINIT_HOME/zinit.zsh"

# pure: A minimal prompt with Git and async support.
zinit ice ver'dbefd0d' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
zstyle ':prompt:pure:git:stash' show yes
zstyle ':prompt:pure:prompt:error' color 1
zstyle ':prompt:pure:prompt:success' color 15

# atuin: Shell history integration.
zinit ice as"command" from"gh-r" bpick"atuin-*.tar.gz" mv"atuin*/atuin -> atuin" \
	atclone"./atuin init zsh > init.zsh; ./atuin gen-completions --shell zsh > _atuin" \
	atpull"%atclone" src"init.zsh"
zinit light atuinsh/atuin

# fzf-tab: Replace default completion selection menu with `fzf`.
zinit ice ver'0fbd575'
zinit light Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' fzf-flags $FZF_DEFAULT_COLORS --height='20%' --margin='0,2'

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

# zoxide: A smarter cd command.
if (command -v zoxide &> /dev/null) {
	export _ZO_DATA_DIR="$XDG_DATA_HOME/zoxide"
	export _ZO_EXCLUDE_DIRS="**/node_modules"
	eval "$(zoxide init zsh)"
}

# Replay compdefs from plugins.
zinit cdreplay -q
