typeset -ga configs=(
	modules
	options
	environment
	completion
	aliases
	line-editor
)

for name in "${configs[@]}"; do
	# shellcheck disable=SC1090
	source "${0%/*}/$name.zsh"
done

unset configs name
