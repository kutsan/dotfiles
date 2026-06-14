# `zinit` installation is managed by chezmoi external sources.
typeset -g ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
source "$ZINIT_HOME/zinit.zsh"

typeset -gA PLUGIN_LOCK
while IFS=, read -r key value; do
	[[ -z $key ]] && continue
	PLUGIN_LOCK[$key]=$value
done < $ZDOTDIR/plugins-lock.csv

typeset -ga plugins=(
	pure
	atuin
	fzf-tab
	auto-suggestions
	auto-pair
	system-clipboard
	fast-syntax-highlighting
)

for name in $plugins; do
	source "${0:h}/$name.zsh"
done

# Replay compdefs from plugins
zinit cdreplay -q

unset plugins PLUGIN_LOCK name key value
