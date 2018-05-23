# Utility function to return the first installed binary for given executables.
function find_alternative() {
	local i=''

	foreach i ($*) {
		if (hash "$i" &>/dev/null) {
			echo "$i"
			return 0
		}
	}
}

# Initialize $PATH with system binaries.
path=(
	/usr/local/bin
	/usr/local/sbin
	/usr/bin
	/bin
	/usr/sbin
	/sbin
	$path
)

# Platform specific variables.
if [[ $OSTYPE =~ 'darwin*' ]] {
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

} elif [[ $OSTYPE =~ 'linux-android*' ]] 2>/dev/null {
	# Shell variable
	export SHELL=$(which zsh)

	# Local scripts
	path=($HOME/.termux/bin $path)
}

# Set path for local scripts.
path=($path $HOME/.bin{,/external})

# Term
export TERM='xterm-256color'

# Default Editors
export EDITOR=$(find_alternative nvim vim vi)
export GUI_EDITOR=$(find_alternative gemacs gvim)

# Default Pager
export PAGER='less'

# Browser
export BROWSER=$(find_alternative google-chrome xdg-open open)

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

# man
export MANWIDTH='100' # Fixed line width for man pages
	if ([[ $OSTYPE =~ 'linux-android*' ]] 2>/dev/null) { MANWIDTH='50' }
export MANPAGER="nvim +'set filetype=man' -"
	if ([[ $OSTYPE =~ 'linux-android*' ]] 2>/dev/null) { unset MANPAGER }

# nvim
export NVIM_RPLUGIN_MANIFEST="$HOME/.vim/cache/share/rplugin.vim"
# export NVIM_NODE_LOG_FILE="$HOME/.vim/cache/log/node.log"
# export NVIM_NODE_LOG_LEVEL='4'

# node
export NODE_REPL_HISTORY="$HOME/.node/nodereplhistory"

# npm
export NPM_CONFIG_INIT_AUTHOR_NAME='Kutsan Kaplan'
export NPM_CONFIG_INIT_AUTHOR_EMAIL='me@kutsankaplan.com'
export NPM_CONFIG_INIT_AUTHOR_URL='https://kutsankaplan.com'
export NPM_CONFIG_INIT_LICENSE='GPL-3.0'
export NPM_CONFIG_INIT_VERSION='0.0.0'
export NPM_CONFIG_SAVE_PREFIX='~'
export NPM_CONFIG_SIGN_GIT_TAG='true'

# GnuPG
export GPG_TTY=$(tty)

# wget
export WGETRC="$HOME/.config/wget/wgetrc"

# ranger
export RANGER_LOAD_DEFAULT_RC='false'
export RANGER_LAST_DIRECTORY_BUFFER="$XDG_DATA_HOME/ranger/last_directory"

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
	--exact \
	--no-bold \
	--inline-info \
	--height='40%' \
	--jump-labels='bmvenritusldkfjgh' \
	--bind='ctrl-f:jump-accept'"

# highlight
export HIGHLIGHT_OPTIONS='--out-format="xterm256" --style="pablo"'

# less
export LESS=" \
	--ignore-case \
	--tilde \
	--chop-long-lines \
	--status-column \
	--LONG-PROMPT \
	--jump-target=10 \
	--RAW-CONTROL-CHARS \
	--clear-screen \
	--silent \
	--tabs=4 \
	--shift=5"
export LESSOPEN="| highlight $HIGHLIGHT_OPTIONS -- %s 2>/dev/null" # Use `highlight` program to try to highlight opened file according to its extension.
export LESSHISTFILE="$HOME/.config/less/lesshistory" # Command and search history file.
export LESSKEYRC="$HOME/.config/less/lesskey" # Path of the uncompiled lesskey file.
export LESSKEY="$LESSKEYRC.lwc" # Path of the compiled lesskey file.
export LESS_TERMCAP_md=$(tput bold; tput setaf 4) # Turn on bold mode.
export LESS_TERMCAP_me=$(tput sgr0) # Turn off all attributes.
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # Begin standout mode.
export LESS_TERMCAP_se=$(tput rmso; tput sgr0) # Exit standout mode.
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 250) # Begin underline mode.
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0) # Exit underline mode.
export LESS_TERMCAP_mr=$(tput rev) # Turn on reverse video mode.
export LESS_TERMCAP_mh=$(tput dim) # Turn on half-bright mode.
export LESS_TERMCAP_ZN=$(tput ssubm) # Enter subscript mode.
export LESS_TERMCAP_ZV=$(tput rsubm) # End subscript mode.
export LESS_TERMCAP_ZO=$(tput ssupm) # Enter superscript mode.
export LESS_TERMCAP_ZW=$(tput rsupm) # End superscript mode.

# sdcv
export SDCV_PAGER='fold -s -w 100 | less'

# Clear utility function.
unset -f find_alternative
