# Load zrecompile for zcompile.
autoload -U zrecompile

# Make special variables duplicate-free.
typeset -g -U path fpath cdpath

# Initialize $PATH with local system binaries.
path=(/usr/local/{,s}bin $path)

# Set zsh custom autoload directory.
fpath+=("$ZDOTDIR/autoload")

# Soft link prompt theme if it's not already linked.
if ! [[ -L ~/.zsh/autoload/prompt_pure_setup ]] { ln -s ~/.zsh/plugins/pure/pure.zsh ~/.zsh/autoload/prompt_pure_setup }
if ! [[ -L ~/.zsh/autoload/async ]] { ln -s ~/.zsh/plugins/pure/async.zsh ~/.zsh/autoload/async }

# Load prompt system.
autoload -U promptinit && promptinit

# Load and recompile completion initialization to enable completion.
autoload -U compinit && compinit -d $ZDOTDIR/cache/.zcompdump

# Load edit in $EDITOR function.
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'gv' edit-command-line

# Load hook API.
autoload -U add-zsh-hook

# Load color variables.
autoload -U colors && colors

# Load ZLE surround plugin.
autoload -U surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd 'cs' change-surround
bindkey -M vicmd 'ds' delete-surround
bindkey -M vicmd 'ys' add-surround
bindkey -M visual 'S' add-surround

# Load ZLE text objects for delimiters.
autoload -U select-quoted
zle -N select-quoted
foreach char ({a,i}{\',\",\`}) {
	bindkey -M visual $char select-quoted
	bindkey -M viopp $char select-quoted
}
unset char

# Load ZLE text objects for pairs of brackets.
autoload -U select-bracketed
zle -N select-bracketed
foreach char ({a,i}${(s..)^:-'()[]{}<>bB'}) {
	bindkey -M visual $char select-bracketed
	bindkey -M viopp $char select-bracketed
}
unset char

# Load extra features for completion.
zmodload zsh/complist

# Load fasd to track most used files and directories.
_fasd_preexec() {
	if (hash fasd &>/dev/null) {
		fasd --proc $(fasd --sanitize "$1") &>/dev/null
	}
}
add-zsh-hook preexec _fasd_preexec
