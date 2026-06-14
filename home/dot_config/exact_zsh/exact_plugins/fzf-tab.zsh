fzf_tab_init() {
	# shellcheck disable=SC2016
	zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
	# shellcheck disable=SC2016
	zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
	zstyle ':fzf-tab:*' fzf-flags "$FZF_DEFAULT_COLORS" --height='20%' --margin='0,2'
}

zinit \
	light-mode \
	atclone"git switch --detach ${PLUGIN_LOCK['fzf-tab']}" \
	atpull'%atclone' \
	atinit'fzf_tab_init' \
	atload'unset -f fzf_tab_init' \
	for Aloxaf/fzf-tab
