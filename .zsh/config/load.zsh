# Make special variables duplicate-free.
typeset -gU path fpath cdpath

# Define functions to load them on execution.
foreach function (
	add-zsh-hook
	compinit
	promptinit
	select-bracketed
	select-quoted
	surround
) {
	autoload -U $function
}

# Load binary modules.
foreach module (
	complete
	complist
	datetime
	parameter
	regex
	zle
	zleparameter
	zpty
	zutil
) {
	zmodload zsh/$module
}

# Initialize completion with its cache file.
compinit -i -d $ZDOTDIR/cache/.zcompdump
