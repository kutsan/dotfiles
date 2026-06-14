# Define functions to load them on execution.
for fn in \
	compinit \
	promptinit \
	surround \
	select-bracketed \
	select-quoted; do
	autoload -Uz "$fn"
done

# Load binary modules.
for module in \
	complete \
	complist \
	datetime \
	parameter \
	regex \
	zle \
	zleparameter \
	zpty \
	zutil; do
	zmodload "zsh/$module"
done
