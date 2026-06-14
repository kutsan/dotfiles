# shellcheck disable=SC2139

# Editors
alias e="$EDITOR"
compdef e="$EDITOR"
alias ge="$GUI_EDITOR"
compdef ge="$GUI_EDITOR"

# File & Directory Operations
alias rm='trash'
alias mv='mv -iv'
alias mkdir='mkdir -p'

# `cd` into the last directory upon exit using `yazi`.
y() {
	emulate -L zsh
	# shellcheck disable=SC2155
	local temp_file="$(mktemp -t "yazi-cwd.XXXXXX")"
	# shellcheck disable=SC2064,SC2296
	trap "command rm -f -- ${(q)temp_file}" EXIT INT TERM

	command yazi "$@" --cwd-file="$temp_file"
	# shellcheck disable=SC2155
	local cwd="$(<"$temp_file")"

	# shellcheck disable=SC2164
	[[ -n "$cwd" && "$cwd" != "$PWD" ]] && builtin cd -- "$cwd"
}

# Listing & Search
alias ls='ls -AF --color=auto'
[[ $OSTYPE == darwin* ]] && alias ls='ls -AFG'
alias la='ls -lAh'
alias grep="grep --color='auto'"

# Disk Usage
alias du='du -d 1 --si'
alias df='df -a --si'

# Utilities
alias uuidgen='command uuidgen | tr "[:upper:]" "[:lower:]"'
alias uuidv7="npm exec --yes uuidv7 | tr -d '\n' | pbcopy"
[[ $OSTYPE == darwin* ]] && alias uuidgen='command uuidgen | tr -d "\n" | tr "[:upper:]" "[:lower:]" | pbcopy'

# Encryption
alias age-encrypt='age --encrypt --recipients-file "$XDG_CONFIG_HOME/age/recipients.txt"'
alias age-decrypt='age --decrypt --identity "$XDG_DATA_HOME/age/key.txt"'

# Package Managers & Tooling
alias pn='pnpm'
alias px='pnpx'
alias cz='chezmoi'
alias bb='brew bundle --global --verbose'

# Git
alias g='git'
compdef g='git'
alias lg='lazygit'
alias lgs='lazygit status'
alias lgl='lazygit log'
alias lgb='lazygit branch'
alias lgt='lazygit stash'

# shellcheck disable=SC2190
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

# shellcheck disable=SC2066,SC2296
for key in "${(@k)git_aliases}"; do
	alias "g$key=git $key"
	compdef _git "g$key=git-${git_aliases[$key]}"
done

unset git_aliases key

# Disabled Commands
alias clear='echo "Use \`^L\`." >&2; false'
alias caffeinate='echo "Use equivalent GUI utility app." >&2; false'
