# Make special variables duplicate-free.
typeset -g -U path fpath cdpath

# Set zsh custom autoload directory.
fpath=($fpath "$ZDOTDIR/autoload")

# Load zrecompile for zcompile.
autoload -U zrecompile

# Load prompt system.
autoload -U promptinit

# Load completion initialization to enable completion.
autoload -U compinit
compinit -d $ZDOTDIR/cache/.zcompdump # Completion cache file.

# Load custom hooks API.
autoload -U add-zsh-hook

# Load and register edit in $EDITOR function.
autoload -U edit-command-line
zle -N edit-command-line

# Load and register ZLE surround plugin.
autoload -U surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround

# Load and register ZLE text objects for delimiters.
autoload -U select-quoted
zle -N select-quoted

# Load and register ZLE text objects for pairs of brackets.
autoload -U select-bracketed
zle -N select-bracketed

# Load extra features for completion.
zmodload zsh/complist
