# Add Docker CLI completions.
fpath=(
	"$HOME/.docker/completions"
	$fpath
)

# Initialize the completion system with a cache time of 24 hours.
typeset -g zcompdump_path="$XDG_CACHE_HOME/zsh/zcompdump"
typeset -g zcompdump_match=($zcompdump_path(Nm-24))

if (( $#zcompdump_match )) {
	compinit -i -C -d $zcompdump_path
} else {
	compinit -i -d $zcompdump_path
}

unset zcompdump_path
unset zcompdump_match

# Replay compdefs from zinit plugins.
zinit cdreplay -q

# Completion settings.
zstyle ':completion:*' menu select # Use completion menu for completion when available.
zstyle ':completion:*' rehash true # When new programs is installed, auto update without reloading.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s#:#)LS_COLORS} # Match dircolors with completion schema.
