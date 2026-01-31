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

# Load `zinit` plugin manager.
ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
