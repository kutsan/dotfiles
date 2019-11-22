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
	vcs_info
	zrecompile
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

# Completion cache file.
compinit -d $ZDOTDIR/cache/.zcompdump
