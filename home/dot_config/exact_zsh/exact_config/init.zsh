typeset -ga configs=(
	modules
	options
	environment
	completion
	aliases
	line-editor
)

for name in $configs; do
	source "${0:h}/$name.zsh"
done

unset configs name
