# Editors
alias e="$EDITOR"; compdef e="$EDITOR"
alias ge="$GUI_EDITOR"; compdef ge="$GUI_EDITOR"

# File & Directory Operations
alias rm='trash' # Use `trash` program instead of built-in irrecoverable way to delete nodes.
alias mv='mv -iv' # Move nodes with interactive mode and extra verbosity.
alias mkdir='mkdir -p' # Make missing parent directories when creating folders.

# `cd` into the last directory upon exit using `yazi`.
y() {
	emulate -L zsh
	local temp_file="$(mktemp -t "yazi-cwd.XXXXXX")"
	trap "command rm -f -- ${(q)temp_file}" EXIT INT TERM

	command yazi "$@" --cwd-file="$temp_file"
	local cwd="$(<$temp_file)"

	[[ -n "$cwd" && "$cwd" != "$PWD" ]] && builtin cd -- "$cwd"
}

# Listing & Search
alias ls='ls -AF --color=auto' # List all nodes with type indicators and colors.
[[ $OSTYPE == darwin* ]] && alias ls='ls -AFG'
alias la='ls -lAh' # List all nodes in long format with human-readable sizes.
alias grep="grep --color='auto'" # Grep with colors.

# Disk Usage
alias du='du -d 1 --si' # Display sizes of entries one level deep with SI units.
alias df='df -a --si' # Display all filesystem usage with SI units.

# Utilities
alias uuidgen='print -r -- ${$(command uuidgen):l}' # Generate a lowercase UUID.
alias uuidv7="npm exec --yes uuidv7 | tr -d '\n' | pbcopy" # Generate a lowercase UUIDv7 and copy to clipboard.
[[ $OSTYPE == darwin* ]] && alias uuidgen='print -n ${$(command uuidgen):l} | pbcopy' # Generate a lowercase UUID and copy to clipboard.

# Encryption
alias age-encrypt='age --encrypt --recipients-file "$XDG_CONFIG_HOME/age/recipients.txt"'
alias age-decrypt='age --decrypt --identity "$XDG_DATA_HOME/age/key.txt"'

# Package Managers & Tooling
alias pn='pnpm'
alias px='pnpx'
alias cz='chezmoi'
alias bb='brew bundle --global --verbose'

# Git
alias g='git'; compdef g='git'
alias lg='lazygit'
alias lgs='lazygit status'
alias lgl='lazygit log'
alias lgb='lazygit branch'
alias lgt='lazygit stash'

typeset -A git_aliases=(
	a add
	b branch
	bl branch
	c commit
	d diff
	ds diff
	f fetch
	l log
	ld log
	la log
	lda log
	r reflog
	rd reflog
	s status
	sm submodule
	sw switch
	t stash
	tl stash
)

for key (${(k)git_aliases}) {
	alias g$key="git $key"
	compdef _git "g$key=git-${git_aliases[$key]}"
}

unset git_aliases key

# Disabled Commands
alias clear='print -u2 "Use \`^L\`."; false'
alias caffeinate='print -u2 "Use equivalent GUI utility app."; false'
