fzf_tab_init() {
	zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
	zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
	zstyle ':fzf-tab:*' fzf-flags $FZF_DEFAULT_COLORS --height='20%' --margin='0,2'
}

zinit \
	light-mode \
	atclone"git switch --detach ${PLUGIN_LOCK[fzf-tab]}" \
	atpull'%atclone' \
	atinit'fzf_tab_init' \
	atload'unfunction fzf_tab_init' \
	for Aloxaf/fzf-tab
