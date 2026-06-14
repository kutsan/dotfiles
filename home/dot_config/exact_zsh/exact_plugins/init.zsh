# `zinit` installation is managed by chezmoi external sources.
typeset -g ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
# shellcheck disable=SC1091
source "$ZINIT_HOME/zinit.zsh"

typeset -gA PLUGIN_LOCK
{
	read -r # discard header row (stored in REPLY, ignored)
	while IFS=, read -r name version || [[ -n $name ]]; do
		# shellcheck disable=SC2034
		PLUGIN_LOCK[$name]=$version
	done
} <"$ZDOTDIR/plugins-lock.csv"

typeset -ga plugins=(
	pure
	atuin
	fzf-tab
	auto-suggestions
	auto-pair
	system-clipboard
	fast-syntax-highlighting
)

for name in "${plugins[@]}"; do
	# shellcheck disable=SC1090
	source "${0%/*}/$name.zsh"
done

# Replay compdefs from plugins
zinit cdreplay -q

unset plugins PLUGIN_LOCK name version
