# man
export MANWIDTH='100'
if command -v nvim &>/dev/null; then
	export MANPAGER='nvim +Man!'
fi

# GnuPG
export GPG_TTY="$TTY"

# fzf
export FZF_DEFAULT_COMMAND='fd --no-ignore'
export FZF_DEFAULT_COLORS='--color=dark,fg:-1,bg:-1,hl:4,fg+:7,bg+:0,gutter:0,hl+:4,info:8,border:8,prompt:4,pointer:3,marker:3,spinner:8,header:6'
export FZF_DEFAULT_OPTS="\
	$FZF_DEFAULT_COLORS \
	--no-multi \
	--no-mouse \
	--height='40%' \
	--margin='1,3' \
	--layout='reverse' \
	--info='inline' \
	--no-separator \
	--no-bold \
	--bind='ctrl-f:half-page-down' \
	--bind='ctrl-b:half-page-up'"

# Load fzf key bindings and completion.
if command -v fzf &>/dev/null; then
	# shellcheck disable=SC1090
	source <(fzf --zsh)
fi

# zoxide: A smarter cd command
if command -v zoxide &>/dev/null; then
	export _ZO_DATA_DIR="$XDG_DATA_HOME/zoxide"
	export _ZO_EXCLUDE_DIRS="**/node_modules"
	eval "$(zoxide init zsh)"
fi

if command -v mise &>/dev/null; then
	eval "$(mise activate zsh)"
fi

# less
export LESS="\
	--ignore-case \
	--tilde \
	--chop-long-lines \
	--status-column \
	--LONG-PROMPT \
	--jump-target=10 \
	--RAW-CONTROL-CHARS \
	--clear-screen \
	--tabs=4 \
	--shift=5"
export LESSHISTFILE='-'                          # Disable history.
export LESSKEYIN="$XDG_CONFIG_HOME/less/lesskey" # Path of lesskey file.
export LESS_TERMCAP_md=$'\e[01;34m'              # Turn on bold mode.
export LESS_TERMCAP_me=$'\e[0m'                  # Turn off all attributes.
export LESS_TERMCAP_mh=$'\e[2m'                  # Turn on dim mode.
export LESS_TERMCAP_mr=$'\e[7m'                  # Turn on reverse mode.
export LESS_TERMCAP_se=$'\e[27;0m'               # Exit standout mode.
export LESS_TERMCAP_so=$'\e[1;33m'               # Begin standout mode.
export LESS_TERMCAP_ue=$'\e[24;0m'               # Exit underline mode.
export LESS_TERMCAP_us=$'\e[4;1;38;5;250m'       # Begin underline mode.

# ls
LS_COLORS="$(<"$XDG_CONFIG_HOME/ls/colors")"
export LS_COLORS
