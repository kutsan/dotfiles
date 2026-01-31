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

# Replay compdefs from zinit plugins.
zinit cdreplay -q

# Completion settings.
zstyle ':completion:*' menu select # Use completion menu for completion when available.
zstyle ':completion:*' rehash true # When new programs is installed, auto update without reloading.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s#:#)LS_COLORS} # Match dircolors with completion schema.
