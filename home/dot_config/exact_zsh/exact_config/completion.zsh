# Add Docker CLI completions.
if (command -v docker &> /dev/null) {
	fpath=(
		"$HOME/.docker/completions"
		$fpath
	)
}

# Completion settings
zstyle ':completion:*' menu no # Disable the completion menu in favor of `fzf-tab` plugin.
zstyle ':completion:*:descriptions' format '[%d]' # Show descriptions in brackets.
zstyle ':completion:*' rehash true # When new programs is installed, auto update without reloading.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s#:#)LS_COLORS} # Match dircolors with completion schema.

# Cache directory should be created manually since zsh doesn't create
# XDG Base Directory paths automatically.
typeset -g zsh_cache_dir="$XDG_CACHE_HOME/zsh"

if ! [[ -d "$zsh_cache_dir" ]] {
	command mkdir -p "$zsh_cache_dir"
}

# Initialize the completion system with a cache time of 24 hours.
typeset -g zcompdump_path="${zsh_cache_dir}/zcompdump"
typeset -g zcompdump_match=($zcompdump_path(Nm-24))

if (( $#zcompdump_match )) {
	compinit -i -C -d $zcompdump_path
} else {
	compinit -i -d $zcompdump_path
}

unset zsh_cache_dir
unset zcompdump_path
unset zcompdump_match

# Remove the Homebrew version of `git` completions, as they are incompatible with Zsh aliases.
if [[ $OSTYPE =~ 'darwin*' ]] {
	function remove_conflicting_git_completions() {
		local git_completion_bash="$HOMEBREW_PREFIX/share/zsh/site-functions/git-completion.bash"
		local git_completion_zsh="$HOMEBREW_PREFIX/share/zsh/site-functions/_git"

		if [[ -e "$git_completion_bash" ]] {
			command rm "$git_completion_bash"
		}

		if [[ -e "$git_completion_zsh" ]] {
			command rm "$git_completion_zsh"
		}
	}

	remove_conflicting_git_completions
	unfunction remove_conflicting_git_completions
}
