zinit \
	light-mode \
	as"command" \
	from"github-rel" \
	ver"${PLUGIN_LOCK[atuin]}" \
	bpick"atuin-*.tar.gz" \
	mv"atuin*/atuin -> atuin" \
	atclone"./atuin init zsh > init.zsh; ./atuin gen-completions --shell zsh > _atuin" \
	atpull"%atclone" \
	src"init.zsh" \
	for atuinsh/atuin
