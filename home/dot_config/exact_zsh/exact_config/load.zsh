# Set XDG base directories.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Make special variables duplicate-free.
typeset -gU path fpath cdpath

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

# Load Homebrew environment on macOS.
if ([[ $OSTYPE =~ 'darwin*' ]]) {
	eval "$(/opt/homebrew/bin/brew shellenv)"
}

# Add Docker CLI completions.
fpath=(
	"$HOME/.docker/completions"
	$fpath
)

# Initialize the completion system with a cache time of 24 hours.
typeset -g zcompdump="$XDG_DATA_HOME/zsh/zcompdump"
typeset -g comp_files=($zcompdump(Nm-24))

if (( $#comp_files )) {
	compinit -i -C -d $zcompdump
} else {
	compinit -i -d $zcompdump
}

unset zcompdump
unset comp_files
