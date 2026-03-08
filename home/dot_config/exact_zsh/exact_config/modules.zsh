# Define functions to load them on execution.
foreach function (
	compinit
	promptinit
	surround
	select-bracketed
	select-quoted
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
