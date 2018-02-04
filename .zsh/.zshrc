# -- Setup {{{1
# --------------------------------------------------------------------------------------------------

# -- Load {{{2
# ------------------------------------------------

# Compile `.zshrc` file for future faster executions.
if ([[ ! -f $ZDOTDIR/.zshrc.zwc ]] || [[ $ZDOTDIR/.zshrc -nt $ZDOTDIR/.zshrc.zwc ]]) {
	zcompile $ZDOTDIR/.zshrc
}

# Make special variables duplicate-free.
typeset -g -U path fpath cdpath

# Initialize $PATH with local system binaries.
path=(/usr/local/{,s}bin $path)

# Set zsh custom autoload directory.
fpath+=("$ZDOTDIR/autoload")

# Load prompt system.
autoload -U promptinit && promptinit

# Load completion initialization function to enable completion.
autoload -U compinit && compinit

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

# -- Prompt {{{2
# ------------------------------------------------

# Prompt theme
prompt pure

# Prompt options
typeset -g PROMPT_CURRENT_SYMBOL="$PROMPT_INSERT_MODE_SYMBOL"
typeset -g PROMPT_INSERT_MODE_SYMBOL=''
typeset -g PROMPT_NORMAL_MODE_SYMBOL='▢'
typeset -g PROMPT_NORMAL_STATUS_COLOR='white'
typeset -g PROMPT_ERROR_STATUS_COLOR='red'

# Primary Prompt
PROMPT='%(?.%F{$PROMPT_NORMAL_STATUS_COLOR}.%F{$PROMPT_ERROR_STATUS_COLOR})${PROMPT_CURRENT_SYMBOL}%f '

# Spelling Correction Prompt
SPROMPT="zsh: correct %F{red}'%R'%f to %F{red}'%r'%f [%B%Uy%u%bes, %B%Un%u%bo, %B%Ue%u%bdit, %B%Ua%u%bbort]? "

# Transform the cursor to box form on ssh command.
function preexec() {
	if [[ "$2" =~ '^ssh' ]] {
		printf '\033[0 q'
	}
}

# ZLE hooks for prompt's Vim mode status
function zle-line-init zle-keymap-select {
	# Change the cursor style depending on keymap mode.
	if [[ "$SSH_CONNECTION" == '' ]] {
		if [[ "$KEYMAP" =~ 'main|viins' ]] {
			printf '\033[6 q' # Vertical bar.
		} else {
			printf '\033[0 q' # Box.
		}
	}

	# Change the prompt symbol depending on keymap mode.
	PROMPT_CURRENT_SYMBOL=${${KEYMAP/vicmd/${PROMPT_NORMAL_MODE_SYMBOL}}/(main|viins)/${PROMPT_INSERT_MODE_SYMBOL}}

	# Redraw if necessary.
	zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# -- Multiplexer {{{2
# ------------------------------------------------

# Auto-attach tmux or start at launch with different sessions based on platforms.
if (
	hash tmux 2>/dev/null \
	&& [[ $TMUX == '' ]] \
	&& [[ $SUDO_USER == '' ]] \
	&& [[ $EMACS == '' ]] \
	&& [[ $VIM == '' ]] \
	&& [[ $SSH_CONNECTION == '' ]] \
	&& [[ $(uname -o) != 'Android' ]] 2>/dev/null
) {
	typeset -g session=''

	# VSCode integrated terminal
	if [[ $VSCODE_PID != '' ]] {
		session='vscode'

	# Terminal emulator
	} else {
		session='main'
	}

	tmux attach-session -t "$session" \
		|| tmux -f "$HOME/.tmux/tmux.conf" new -s "$session" && exit 0

	unset session
}

# -- Exports {{{1
# --------------------------------------------------------------------------------------------------

# Return the first installed binary for given executables, used by environment variables.
function _find_alt() {
	local i=''

	foreach i ($*) {
		if (hash "$i" &>/dev/null) {
			echo "$i"
			return 0
		}
	}
}

# Platform Specific Variables
if [[ $(uname) == 'Darwin' ]] {
	# coreutils
	export GNU_COREUTILS_HOME='/usr/local/opt/coreutils/libexec/gnubin'
	export GNU_COREUTILS_MAN_HOME='/usr/local/opt/coreutils/libexec/gnuman'
	path=($GNU_COREUTILS_HOME $path)
	manpath=($GNU_COREUTILS_MAN_HOME $manpath)

	# findutils
	export GNU_FINDUTILS_HOME='/usr/local/opt/findutils/libexec/gnubin'
	export GNU_FINDUTILS_MAN_HOME='/usr/local/opt/findutils/libexec/gnuman'
	path=($GNU_FINDUTILS_HOME $path)
	manpath=($GNU_FINDUTILS_MAN_HOME $manpath)

	# curl
	export CURL_HOME='/usr/local/opt/curl/bin'
	export CURL_MAN_HOME='/usr/local/opt/curl/share/man'
	path=($CURL_HOME $path)
	manpath=($CURL_MAN_HOME $manpath)

	# ncurses
	export NCURSES_HOME='/usr/local/opt/ncurses/bin'
	path=($NCURSES_HOME $path)

	# Android SDK
	export ANDROID_HOME="$HOME/Library/Android/sdk"
	path=($path $ANDROID_HOME/{tools,platform-tools})

	# Java Development Kit
	export JAVA_HOME=$(/usr/libexec/java_home)

} elif [[ $(uname -o) == 'Android' ]] 2>/dev/null {
	path=($HOME/.termux/bin $path)
}

# Primary Path
path=($path $HOME/.bin{,/external}) # Local scripts.

# Term
export TERM='xterm-256color'

# Default Editors
export EDITOR=$(_find_alt nvim vim vi)
	if ! [[ -L ~/.vim/vimrc ]] { ln -s ~/.vim/init.vim ~/.vim/vimrc }
	if ! [[ -L ~/.config/nvim ]] { ln -s ~/.vim ~/.config/nvim }
export GUI_EDITOR=$(_find_alt gemacs gvim)

# Default Pager
export PAGER='less'

# Browser
export BROWSER=$(_find_alt google-chrome xdg-open open)

# Default Config and Cache Home
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# Mailcap
export MAILCAPS="$HOME/.mutt/mailcap"

# Locale
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# dircolors
eval $(dircolors --sh "$ZDOTDIR/dircolors")

# man
export MANWIDTH='100' # Fixed line width for man pages
	if ([[ $(uname -o) == 'Android' ]] 2>/dev/null) { MANWIDTH='50' }

# GitHub
export GITHUB_USERNAME='kutsan'

# npm
export NPM_CONFIG_INIT_AUTHOR_NAME='Kutsan Kaplan'
export NPM_CONFIG_INIT_AUTHOR_EMAIL='me@kutsankaplan.com'
export NPM_CONFIG_INIT_AUTHOR_URL='https://kutsankaplan.com'
export NPM_CONFIG_INIT_LICENSE='GPLv3'
export NPM_CONFIG_INIT_VERSION='0.1.0'
export NPM_CONFIG_SAVE_PREFIX='~'
export NPM_CONFIG_SIGN_GIT_TAG='true'

# GnuPG
export GPG_TTY=$(tty)

# wget
export WGETRC="$HOME/.config/wget/wgetrc"

# ranger
export RANGER_LOAD_DEFAULT_RC='false'
export RANGER_LAST_DIRECTORY_BUFFER="$HOME/.config/ranger/.last"

# taskwarrior
export TASKRC="$HOME/.task/taskrc"

# fzf
export FZF_DEFAULT_COMMAND="rg \
	--files \
	--no-messages \
	--no-ignore \
	--hidden \
	--follow \
	--ignore-case \
	--glob '!{.git,node_modules}/*'"
export FZF_DEFAULT_COLORS='--color=dark,fg:7,fg+:7,bg:0,bg+:8,hl:4,hl+:4,info:8,border:8,prompt:4,pointer:3,marker:3,spinner:8,header:6'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_COLORS \
	--no-multi \
	--no-bold \
	--height='40%' \
	--jump-labels='bmvenritusldkfjgh' \
	--bind='ctrl-f:jump-accept'"
export FZF_COMPLETION_TRIGGER='?'
export FZF_COMPLETION_OPTS='--preview="highlight --out-format=xterm256 --style=pablo {} 2>/dev/null || cat {}"'

# transmission
export TRANSMISSION_HOME="$HOME/.config/transmission/"

# highlight
export HIGHLIGHT_OPTIONS='--out-format="xterm256" --style="pablo"'

# less
source "$HOME/.config/less/lessrc" # Load core options.
export LESSHISTFILE="$HOME/.config/less/lesshistory" # Command and search history file.
export LESSKEYRC="$HOME/.config/less/lesskey" # Path of the uncompiled lesskey file.
export LESSKEY="$LESSKEYRC.lwc" # Path of the compiled lesskey file.
	if ([[ ! -f $LESSKEY ]] || [[ $LESSKEYRC -nt $LESSKEY ]]) { lesskey -o $LESSKEY $LESSKEYRC } # Compile lesskey file every time if compile is needed.

# sdcv
export SDCV_PAGER='fold -s -w 100 | less'

# -- Options {{{1
# --------------------------------------------------------------------------------------------------

# Zsh Line Editor
typeset -g zle_highlight=(region:bg=black) # Highlight the background of the text when selecting.
setopt NO_BEEP # Don't beep on errors.

# Changing Directories
DIRSTACKSIZE=9 # The maximum size of the directory stack for `pushd` and `popd`.
setopt AUTO_CD # If can't execute the directory, perform the cd command to that.
setopt AUTO_PUSHD # Make cd push the old directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS # Don't push multiple copies of the same directory onto the stack.

# Completion
zstyle ':completion:*' menu select # Use completion menu for completion when available.
zstyle ':completion:*' rehash true # When new programs is installed, auto update without reloading.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # Match dircolors with completion schema.
# zstyle -e ':completion:*:approximate:*' max-errors '(( reply=($#PREFIX+$#SUFFIX)/3 ))'
# zstyle ':completion:*:kill:*' command 'ps f -u $USER -wo pid,ppid,state,%cpu,%mem,tty,cmd'
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*' matcher-list 'm:ss=Ã m:ue=Ã¼ m:ue=Ã m:oe=Ã¶ m:oe=Ã m:ae=Ã¤ m:ae=Ã m:{a-z}={A-Z} r:|[-_.+,]=** r:|=*'
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=01;38;05;255;48;05;161'
# # zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=(01);(38;05;255);(48;05;24)'
# zstyle ':completion::complete:*' use-cache  true
# zstyle ':completion:*' cache-path ~/.zsh/cache
# zstyle ':completion:*' verbose true
# zstyle ':completion:*' menu select=2
# zstyle ':completion:*' special-dirs true
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*:descriptions' format $'%{[(00);(38;05;167)m%}=> %d%{[0m%}'
# # zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
setopt COMPLETE_ALIASES # Prevent aliases from being substituted before completion is attempted.
setopt COMPLETE_IN_WORD # Attempt to start completion from both ends of a word.
setopt GLOB_COMPLETE # Don't insert anything resulting from a glob pattern, show completion menu.
setopt MENU_COMPLETE # Instead of listing possibilities, select the first match immediately.

# Expansion and Globbing
setopt BRACE_CCL # Expand expressions in braces which would not otherwise undergo brace expansion.
setopt EXTENDED_GLOB # Treat the `#`, `~` and `^` characters as part of patterns for globbing.
setopt GLOB_DOTS # Don't require a leading '.' in a filename to be matched explicitly.
setopt MARK_DIRS # Append a trailing `/` to all directory names resulting from globbing.
setopt NO_NOMATCH # If a pattern has no matches, don't print an error, leave it unchanged.
setopt WARN_CREATE_GLOBAL # Warn when a global variables is created in a function.
# setopt WARN_NESTED_VAR # Warn when an existing variables from an outer scope is set in a function.

# History
HISTFILE="$ZDOTDIR/.zshhistory" # Where history logs are stored.
HISTSIZE=10000000 # The maximum number of events stored in the internal history list.
SAVEHIST=10000000 # The maximum number of history events to save in the history file.
setopt BANG_HIST # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY # Save each command's epoch timestamps and the duration in seconds.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS # Don't display a line previously found.
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_DUPS # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_SPACE # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording an entry.
setopt HIST_SAVE_NO_DUPS # Don't write duplicate entries in the history file.
setopt HIST_VERIFY # Don't execute the line directly instead perform history expansion.
setopt INC_APPEND_HISTORY # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY # Share history between all sessions.

# Input/Output
KEYTIMEOUT=10 # The time the shell waits, for another key to be pressed in milliseconds.
setopt NO_CLOBBER # Don't allow `>` redirection to override existing files. Use `>!` instead.
setopt NO_FLOW_CONTROL # Disable flow control characters `^S` and `^Q`.
setopt INTERACTIVE_COMMENTS # Allow comments even in interactive shells.
setopt RM_STAR_WAIT # Before executing `rm *` first wait 10 seconds and ignore anything typed.

# Job Control
setopt LONG_LIST_JOBS # Display PID when suspending processes as well.

# -- Aliases {{{1
# --------------------------------------------------------------------------------------------------

# Core Shortcuts
alias s='sudo'
alias vim='nvim'
alias v='vim'
alias :q='exit'
alias c='clear'
alias ip='ip -color'
alias rm='trash' # Use `trash` program instead of sending anything to black hole.
alias mv='mv --interactive --verbose' # Prompt before overwriting anything and use extra verbosity.
alias cp='cp --interactive --verbose' # Prompt before overwriting anything and use extra verbosity.
alias ln='ln --interactive --verbose' # Prompt before overwriting anything and use extra verbosity.
alias mkdir='mkdir --parents' # Make parent directories as needed.
alias dirs='dirs -v -p' # Print directory stack with numbers and one directory per line.
alias grep='grep --color=auto --exclude-dir=".git" --exclude-dir="node_modules"' # Always use colors and ignore some directories.
alias du='du --max-depth=1 --si' # Display size of files and folders under current directory.
alias df='df --all --si --print-type' # Display all disk usage statistics with SI units, FS types.
alias h='fc -l -f -i' # Show history with ISO 8601 compatible history time stamp format.
alias ls='ls --almost-all --classify --color=always --group-directories-first --literal'
alias lsa='ls -l --almost-all --si' # List all files and folders.
alias lsd='ls --directory */ | command sed "s#//##"' # List only directories.
alias lsf='ls --almost-all -1 | command grep --invert-match "/$"' # List only files.
alias f='xdg-open "$PWD"' # Open current directory onto GUI file browser.
alias path="echo $PATH | cut --delimiter=':' --fields=1- --output-delimiter=$'\n'"

# Custom Shortcuts
alias t='task'
alias tmux='tmux -f "$HOME/.tmux/tmux.conf"'
alias dfc='dfc -dmT' # -d: Show used size. -m: Base 10 output. -T: Show file system types.
alias cdu='cdu --intelligent --log --reverse --sort --du h'
alias syncthing='syncthing -home=$HOME/.config/syncthing'
alias exa='exa --color=always --all --classify --group-directories-first --long --git --group'
alias serve='browser-sync start --config ~/.config/browsersync/config.js'
alias jq='jq --tab --indent 4'
alias news='newsboat --quiet'
alias def='sdcv --color'
alias cal='gcal \
	--highlighting="$bg[red]:$reset_color:$fg[yellow]:$reset_color" \
	--pager \
	--starting-day=1 \
	--cc-holidays=TR \
	$(date +'%Y')'
alias search="rg \
	--color='always' \
	--heading \
	--line-number \
	--no-messages \
	--no-ignore \
	--hidden \
	--follow \
	--smart-case \
	--glob '!{.git/*,node_modules/*,$(basename $HISTFILE)}' \
	--regexp"

# Global Aliases
alias -g ND='*(/om[1])' # Newest directory.
alias -g NF='*(.om[1])' # Newest file.
alias -g L='| less'
alias -g H='--help | less'
alias -g V='| vim -R -' # Read-only Vim as pager.
alias -g G='| grep'
alias -g WC='| wc'
alias -g HE='| head'
alias -g TA='| tail'
alias -g NE='2>/dev/null' # No sterr.
alias -g NO='&>/dev/null' # No stout and sterr (shorthand for 1>/dev/null 2>&1).
alias -g AWK="| awk '{}'"
alias -g SED="| sed"
alias -g R='| rg'
alias -g F='| fzf'

# Configs
alias c-alacritty="$EDITOR ~/.config/alacritty/alacritty.yml"
alias c-browsersync="$EDITOR ~/.config/browsersync/config.js"
alias c-editorconfig="$EDITOR ~/.editorconfig"
alias c-emacs="$EDITOR ~/.emacs.d/init.el"
alias c-git="$EDITOR ~/.config/git/"
alias c-gpg="$EDITOR ~/.gnupg/gpg.conf"
alias c-htop="$EDITOR ~/.config/htop/htoprc"
alias c-karabiner="$EDITOR ~/.config/karabiner/karabiner.json"
alias c-less="$EDITOR $HOME/.config/less/"
alias c-mac="$EDITOR ~/.config/macos/"
alias c-mailcap="$EDITOR ~/.mutt/mailcap"
alias c-mpv="$EDITOR ~/.config/mpv/"
alias c-msmtp="$EDITOR ~/.mutt/msmtprc"
alias c-mutt="$EDITOR ~/.mutt/muttrc"
alias c-newsboat="$EDITOR ~/.newsboat/"
alias c-ranger="$EDITOR ~/.config/ranger/"
alias c-readme="$EDITOR ~/README.md"
alias c-ssh="$EDITOR ~/.ssh/config"
alias c-stig="$EDITOR ~/.config/stig/rc"
alias c-task="$EDITOR ~/.taskrc"
alias c-termux="$EDITOR ~/.termux/"
alias c-tmux="$EDITOR ~/.tmux/"
alias c-transmission="$EDITOR ~/.config/transmission/"
alias c-vim="$EDITOR ~/.vim/init.vim"
alias c-wget="$EDITOR ~/.config/wget/wgetrc"
alias c-youtube-dl="$EDITOR ~/.config/youtube-dl/config"
alias c-zsh="$EDITOR $ZDOTDIR/.zshrc" r-zsh="source $ZDOTDIR/.zshrc"
alias c-zshenv="$EDITOR ~/.zshenv"
alias c-zshhistory="$EDITOR $ZDOTDIR/.zshhistory"

# Git
alias g='git'
alias gs='git status -sb'
alias gf='git fetch'
alias gc='git commit'
alias gb='git branch'
alias gbl='git branch -vv -a'
alias gco='git checkout'
alias gsm='git submodule'
alias gd='git diff'
alias gdt='git difftool'
alias gds='git diff --staged'
alias gl='git log \
	--graph \
	--abbrev-commit \
	--decorate \
	--format=format:"%C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(blue)<%an>%C(reset)%C(bold yellow)%d%C(reset) %C(black)%ar%C(reset)" \
	--all'
alias glt='git log \
	--graph \
	--abbrev-commit \
	--decorate \
	--format=format:"%C(bold black)%ad%C(reset) %C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(blue)<%an>%C(reset)%C(bold yellow)%d%C(reset) %C(black)%ar%C(reset)" \
	--date=format:"%Y-%m-%d %H:%M" \
	--all'
function ga() { git add "$@" && git status -sb }

# -- Functions {{{1
# --------------------------------------------------------------------------------------------------

# Import general error and warning notification utility functions.
source ~/.bin/utils/console.zsh

##
# Returns the bare IP address.
##
function myip() {
	command curl --silent 'https://httpbin.org/ip' | command grep --only-matching --extended-regexp '[0-9\.]*'
}

##
# Makes directory and `cd`s into it.
#
# @param {string} $1 Directory name that will be created.
##
function take() {
	command mkdir --parents --verbose "$1" && cd "$1"
}

##
# List and grep with file permissions.
#
# @param {string} $1 File or directory name in current working directory.
##
function lsg() {
	command ls -l --almost-all --si \
		| command awk \
				'{
					k = 0

					for (i = 0; i <= 8; i++) {
						k += ((substr($1, i + 2, 1)~/[rwx]/) * 2 ^ (8 - i))
					}

					if (k) {
						printf(" %0o ", k)
					}

					print
				}' \
		| command grep --ignore-case --extended-regexp "$1"
}

##
# Former ranger alias.
#
# @param {string} [$1] Directory path which will cd into.
##
function r() {
	ranger "$1" --choosedir=$RANGER_LAST_DIRECTORY_BUFFER \
		&& cd "$(cat $RANGER_LAST_DIRECTORY_BUFFER)" 2>/dev/null
}

##
# `fasd` with `fzf`.
##
function fz() {
	if [[ "$@" == '' ]] {
		local selected_path=$(
			fasd -l -d \
				| fzf \
					--tac \
					--no-sort \
					--exact \
					--prompt='cd ' \
					--preview-window='right:60%' \
					--preview='ls --almost-all --classify --color=always --group-directories-first --literal {} 2>/dev/null'
		)

		cd "$selected_path"
	} else {
		typeset -g _last_z_args="$@"
		_z "$@"
	}
}

##
# Better `git log` with `fzf`.
##
function fgl() {
	git log --graph --color=always --format='%C(auto)%h%d %s %C(black)%C(bold)%cr' "$@" \
		| fzf \
			--height='100%' \
			--ansi \
			--exact \
			--no-sort \
			--reverse \
			--tiebreak='index' \
			--bind='ctrl-s:toggle-sort' \
			--bind='enter:execute: (grep -o "[a-f0-9]\{7\}" | head -1 | xargs -I % sh -c "git show --color=always % | less -R") <<< {}'
}

##
# Better `cd ../../..` with autocomplete
#
# @param {(string|number)} $1 Partial parent directory string or direct number.
##
function ..() {
	if (( ! $# )) {
		cd ..
		return 0
	}

	function __upnum() {
		if [[ "$1" == '' || "$2" == '' || ! "$2" =~ ^[0-9]+$ ]] {
			return 0
		}

		local p="$1"
		local i="$2"

		while (( i-- )) {
			p="$(dirname $p)"
		}

		echo "$p"
	}

	function __updir() {
		if [[ "$1" == '/' || "$1" == '' || "$2" == '' ]] {
			return 0
		}

		local p="$(dirname $1)"
		local a="$(basename $p)"
		local b="$(basename $2)"

		if [[ "$a" == '' || "$b" == '' ]] {
			return 0
		}

		if [[ "$a" == "$b"* ]] {
			echo "$p"; return 0
		}

		__updir "$p" "$2"
	}

	local d="$(__updir "$PWD" "$1")"
	if [[ -d "$d" ]] {
		cd "$d"
		return 0
	}

	local n="$(__upnum "$PWD" "$1")"
	if [[ -d "$n" ]] {
		cd "$n"
		return 0
	}
}

##
# Manual Page Explorer.
# Browse through man pages with fzf.
#
# @param {string} [$1] Query string to search manual pages.
##
function mane() {
	# Responsive window options.
	local preview_window_options=(
		$(
			(( $(tput cols) <= 100 )) && echo 'down:80%' || echo 'left:61%'
		)
		$(
			(( $(tput lines) <= 25 )) && (( $(tput cols) <= 100 )) && echo ':hidden'
		)
	)

	man -k . \
		| fzf \
			--exact \
			--preview='echo {1} | sed -E "s/\s.*|\(.*//" | xargs man' \
			--preview-window="$preview_window_options" \
			--reverse \
			--height='100%' \
			--no-hscroll \
			--query="$1" \
			--prompt='$ man ' \
			--color='hl:3,hl+:3' \
			--bind="enter:execute(echo {1} | sed -E 's/\s.*|\(.*//' | xargs man)" \
			--bind='ctrl-p:toggle-preview' \
			--bind='ctrl-y:preview-up' \
			--bind='ctrl-e:preview-down' \
			--bind='ctrl-u:preview-page-up' \
			--bind='ctrl-d:preview-page-down' \
			--bind='ctrl-alt-y:page-up' \
			--bind='ctrl-alt-e:page-down' \
			--bind='ctrl-alt-u:half-page-up' \
			--bind='ctrl-alt-d:half-page-down'
}

##
# Quick calculator.
#
# @param {string} $1 Math expression.
##
function = {
	python3 -c "from math import *; print($*)"
}

##
# Bookmark manager.
#
# @param {string} [$1] Defined bookmark string.
##
function b() {
	# Bookmarks
	local -A bookmarks=(
		'e' "~/Desktop/"
		'd' "~/Documents/"
		'w' "~/Downloads/"
		'i' "~/Pictures/"
		'p' "~/Projects/"
		'v' "~/Videos/"
	)

	local selected_bookmark

	if [[ "$1" != '' ]] {
		selected_bookmark="${bookmarks[$1]}"
	} else {
		local bookmarks_table

		local key
		foreach key (${(k)bookmarks}) {
			bookmarks_table+="$key ${bookmarks[$key]}\n"
		}

		if (! hash fzf &>/dev/null) {
			echo; console.error "${bold_color}fzf${reset_color} is required for selection menu."; echo

			return 1
		} else {
			selected_bookmark=$(
				printf "$bookmarks_table" \
					| fzf \
						--exact \
						--height='20%' \
						--preview='eval ls --almost-all --classify --color=always --group-directories-first --literal $(echo {} | cut --delimiter=" " --fields=2 -) 2>/dev/null' \
						--preview-window='right:80%' \
					| cut --delimiter=' ' --fields=2
			)
		}
	}

	if [[ "$selected_bookmark" != '' ]] {
		eval cd "$selected_bookmark"
	} else {
		echo; console.error 'Could not find any bookmark to jump in.'; echo

		return 1
	}
}

# -- Mappings {{{1
# --------------------------------------------------------------------------------------------------

# -- Schema {{{2
# ------------------------------------------------

# Enable Vi emulation for ZLE
bindkey -v

# -- Widgets {{{2
# ------------------------------------------------

# Expand global alias to its full form.
function custom-expand-global-alias() {
	if [[ "$LBUFFER" =~ ' [A-Z0-9]+$' ]] {
		zle _expand_alias
	}

	zle self-insert
}

# Insert noglob before the command.
function custom-add-noglob-before-the-command() {
	if [[ "$BUFFER" != *'noglob '* ]] {
		BUFFER="noglob $BUFFER"
		CURSOR=$#BUFFER
	} else {
		BUFFER=${BUFFER/noglob /}
	}
}

# Insert sudo before the command.
function custom-add-sudo-before-the-command() {
	if [[ "$BUFFER" != *'sudo '* ]] {
		BUFFER="sudo $BUFFER"
		CURSOR=$#BUFFER
	} else {
		BUFFER=${BUFFER/sudo /}
	}
}

# Insert last typed word for quick copy-paste.
function custom-insert-last-typed-word() {
	zle insert-last-word -- 0 -1
}

# Show split pane man page for written command.
function custom-tmux-show-man-current-command() {
	if (! hash tmux &>/dev/null || [[ "$TMUX" == '' ]] || [[ "$BUFFER" == '' ]]) {
		return 1
	}

	tmux new-window
	tmux send-keys "man ${${BUFFER//(sudo |noglob |command |builtin |nocorrect |exec )/}%% *}" "Enter"
}

# Activate tmux copy-mode and scroll up depending on key stroke.
function custom-tmux-scroll-up() {
	if (! hash tmux &>/dev/null || [[ "$TMUX" == '' ]]) {
		return 1
	}

	tmux copy-mode

	# "$KEYS" == ^Y
	if [[ "$KEYS" ==  ]] {
		tmux send-keys -X scroll-up

	# "$KEYS" == ^Y
	} elif [[ "$KEYS" ==  ]] {
		tmux send-keys -X halfpage-up
	}
}

# Jump back to last prompt.
function custom-tmux-jump-back-prompt() {
	if (! hash tmux &>/dev/null || [[ "$TMUX" == '' ]]) {
		return 1
	}

	tmux \
		copy-mode \; \
		send-keys -X search-backward "$PROMPT_INSERT_MODE_SYMBOL"
}

# Select command from history into the command line.
function custom-fzf-launch-from-history() {
	if (! hash fzf &>/dev/null) {
		return 1
	}

	setopt LOCAL_OPTIONS NO_GLOB_SUBST NO_POSIX_BUILTINS PIPE_FAIL 2>/dev/null

	local selected=(
		$(
			fc -l 1 \
				| fzf \
					--tac \
					--nth='2..,..' \
					--tiebreak='index' \
					--query="${LBUFFER}" \
					--exact \
					--prompt='$ '
		)
	)

	local stat=$?

	if [[ "$selected" != '' ]] {
		local num=$selected[1]

		if [[ "$num" != '' ]] {
			zle vi-fetch-history -n $num
		}
	}

	zle redisplay
	typeset -f zle-line-init >/dev/null && zle zle-line-init

	return $stat
}

# Execute Zsh Line Editor widgets.
function custom-fzf-execute-widget() {
	if (! hash fzf &>/dev/null) {
		return 1
	}

	local selected=$(
		zle -al \
			| command grep --extended-regexp --invert-match '(orig|^\.|^_)' \
			| fzf \
				--tac \
				--nth='2..,..' \
				--tiebreak='index' \
				--prompt=':'
	)

	local stat=$?

	if [[ "$selected" != '' ]] {
		zle $selected
	}

	return $stat
}

# Search a file with fzf and edit inside $EDITOR.
function custom-fzf-edit-file() {
	local file=$(eval "$FZF_DEFAULT_COMMAND" | fzf --prompt="$EDITOR ")

	if [[ "$file" != '' ]] {
		BUFFER="$EDITOR "$file""
		zle accept-line
	}

	zle redisplay
}

# Register functions as widgets.
foreach widget (
	custom-expand-global-alias
	custom-add-noglob-before-the-command
	custom-add-sudo-before-the-command
	custom-insert-last-typed-word
	custom-tmux-show-man-current-command
	custom-tmux-scroll-up
	custom-tmux-jump-back-prompt
	custom-fzf-launch-from-history
	custom-fzf-execute-widget
	custom-fzf-edit-file
) {
	zle -N $widget
}

# -- Bindings {{{2
# ------------------------------------------------

# Insert Mode
bindkey -M viins '^K' up-history # ^K to previous command.
bindkey -M viins '^J' down-history # ^J to next command.
bindkey -M viins '^F' vi-forward-char # Go forward char or complete current completion.
bindkey -M viins '^?' backward-delete-char # Delete left char with backspace key.
bindkey -M viins '^B' backward-kill-word # Delete a WORD backward.
bindkey -M viins '^[[3~' delete-char # Ensure delete key always delete forward.
bindkey -M viins ' ' custom-expand-global-alias # Space key to expand global aliases.
bindkey -M viins '^X^G' custom-add-noglob-before-the-command # Insert noglob before the command.
bindkey -M viins '^X^M' custom-add-sudo-before-the-command # Insert sudo before the command.
bindkey -M viins '^Y' custom-insert-last-typed-word # Insert last typed word for quick copy-paste.
bindkey -M viins '^R' custom-fzf-launch-from-history # Select command from history into the command line.
bindkey -M viins '^P' custom-fzf-edit-file # Search a file with fzf and edit inside $EDITOR.

# Normal Mode
bindkey -M vicmd 'j' down-line # Override down-line-or-history.
bindkey -M vicmd 'k' up-line # Override up-line-or-history.
bindkey -M vicmd '^K' up-history # ^K to previous command.
bindkey -M vicmd '^J' down-history # ^J to next command.
bindkey -M vicmd 'H' vi-beginning-of-line # Go beginning of line.
bindkey -M vicmd 'L' vi-end-of-line # Go end of line.
bindkey -M vicmd 'gm' custom-tmux-show-man-current-command # Go man page of the current command.
bindkey -M vicmd '^Y' custom-tmux-scroll-up # Activate tmux copy-mode and scroll up depending on key stroke.
bindkey -M vicmd '^U' custom-tmux-scroll-up # Activate tmux copy-mode and scroll up depending on key stroke.
bindkey -M vicmd 'gb' custom-tmux-jump-back-prompt # Search back prompt under tmux.
bindkey -M vicmd ':' custom-fzf-execute-widget # Execute Zsh Line Editor widgets.

# Visual Mode
bindkey -M visual 'H' vi-beginning-of-line # Go beginning of line.
bindkey -M visual 'L' vi-end-of-line # Go end of line.

# Operator Mode
bindkey -M viopp 'H' vi-beginning-of-line # Go beginning of line.
bindkey -M viopp 'L' vi-end-of-line # Go end of line.

# Completion Mode
bindkey -M menuselect '^?' undo # Backspace for deleting suggesting completion as a whole.
bindkey -M menuselect '+' accept-and-hold # Accept the selection but keep the completion list open.
bindkey -M menuselect '^K' up-line-or-history # Navigate up completion.
bindkey -M menuselect '^J' down-line-or-history # Navigate down completion.
bindkey -M menuselect '^L' forward-char # Navigate right completion.
bindkey -M menuselect '^H' backward-char # Navigate left completion.
bindkey -M menuselect '^I' down-line-or-history # <Tab> to selection completion forward.
bindkey -M menuselect '^[[Z' reverse-menu-complete # <S-Tab> to select completion backward.

# -- Source {{{1
# --------------------------------------------------------------------------------------------------

# fzf: Fuzzy finder
case "$OSTYPE" {
	darwin*)
		export FZF_HOME='/usr/local/opt/fzf/'
		source "$FZF_HOME/shell/completion.zsh"
		;;

	linux-android*)
		export FZF_HOME="$PREFIX/bin/fzf/"
		source "$PREFIX/share/fzf/completion.zsh"
		;;

	linux*)
		export FZF_HOME="$HOME/.fzf/"
		source "$FZF_HOME/shell/completion.zsh"
		PATH="$PATH:$HOME/.fzf/bin/"
		;;
}

# zsh-autopair: Insert or delete brackets, parens, quotes in pair.
source "$ZDOTDIR/plugins/zsh-autopair/autopair.zsh"

# zsh-system-clipboard: Synchronize system clipboard with ZLE registers.
source "$ZDOTDIR/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh"
	ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'

# zsh-autosuggestions: Fish-like auto-suggestions.
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-syntax-highlighting: Syntax highlighting support.
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
	typeset -A ZSH_HIGHLIGHT_STYLES

	# main
	ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
	ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,underline'
	ZSH_HIGHLIGHT_STYLES[function]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[command]='fg=green'
	ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,underline'
	ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=green,italic'
	ZSH_HIGHLIGHT_STYLES[path]='none,underline'
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=cyan,underline'
	ZSH_HIGHLIGHT_STYLES[path_prefix]='none'
	ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='none'
	ZSH_HIGHLIGHT_STYLES[globbing]='bg=black'
	ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='none'
	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='none'
	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=magenta'
	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
	ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=blue'
	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=blue'
	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=blue'
	ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=blue'
	ZSH_HIGHLIGHT_STYLES[assign]='none,underline'
	ZSH_HIGHLIGHT_STYLES[redirection]='fg=cyan'
	ZSH_HIGHLIGHT_STYLES[comment]='fg=black'
	ZSH_HIGHLIGHT_STYLES[arg0]='default'

	# brackets
	ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='bg=black'

# }}} vim: foldmethod=marker foldlevel=0
