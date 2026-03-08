# Define functions to load them on execution.
foreach fn (
	compinit
	promptinit
	surround
	select-bracketed
	select-quoted
) {
	autoload -U $fn
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
