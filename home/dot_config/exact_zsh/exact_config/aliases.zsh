# Core Shortcuts
alias rm='trash' # Use `trash` program instead of built-in irrecoverable way to delete nodes.
alias mv='mv -iv' # Move nodes with interactive mode and extra verbosity.
alias ln='ln -iv' # Link nodes with interactive mode and extra verbosity.
alias mkdir='mkdir -p' # Make missing parent directories when creating folders.
alias grep="grep --color='auto'" # Grep with colors.
alias du='du -d 1 --si' # Display size of files and folders under current directory.
alias df='df -a --si' # Display all disk usage statistics with SI units and FS types.
alias ls='ls -AF --color=auto' # List name of nodes.
alias la='ls -lAh' # List nodes with their details.
alias clear='echo "Use \`^L\`." && false' # Prevent accidental clearing of the scrollback buffer.
alias uuidgen='print -n ${$(command uuidgen):l} | pbcopy' # Generate a UUID and copy it to the clipboard.

# Custom Shortcuts
alias e="$EDITOR"; compdef e="$EDITOR"
alias ge="$GUI_EDITOR"; compdef ge="$GUI_EDITOR"
alias g='git'; compdef g='git'
alias gs='lazygit'
alias pn='pnpm'
alias px='pnpx'
alias cz='chezmoi'

# macOS-only Aliases
if [[ $OSTYPE =~ 'darwin*' ]] {
	alias ls='ls -AFG' # List name of nodes.
	alias bb='brew bundle --global --verbose'
}

# Git Aliases
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
	sm submodule
	sw switch
)

for key (${(k)git_aliases}) {
	alias g$key="git $key"
	compdef _git "g$key=git-${git_aliases[$key]}"
}

unset git_aliases
unset key
