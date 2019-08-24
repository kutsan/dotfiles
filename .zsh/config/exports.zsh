# Initialize $PATH with system binaries.
path=(
	/usr/local/bin
	/usr/local/sbin
	/usr/bin
	/bin
	/usr/sbin
	/sbin
	~/.local/bin
	$path
)

# Platform specific variables.
case $OSTYPE {
	darwin*)
		export GNU_COREUTILS_HOME='/usr/local/opt/coreutils/libexec/gnubin'
		export GNU_COREUTILS_MAN_HOME='/usr/local/opt/coreutils/libexec/gnuman'
		export GNU_FINDUTILS_HOME='/usr/local/opt/findutils/libexec/gnubin'
		export GNU_FINDUTILS_MAN_HOME='/usr/local/opt/findutils/libexec/gnuman'
		export CURL_HOME='/usr/local/opt/curl/bin'
		export CURL_MAN_HOME='/usr/local/opt/curl/share/man'
		export NCURSES_HOME='/usr/local/opt/ncurses/bin'
		export OPENSSL_HOME='/usr/local/opt/openssl/bin'
		export OPENSSL_MAN_HOME='/usr/local/opt/openssl/man'
		export PYTHON_SYMLINKS_HOME='/usr/local/opt/python/libexec/bin'
		export PYTHONUSERBASE="$HOME/.local/"

		path=(
			$GNU_COREUTILS_HOME
			$GNU_FINDUTILS_HOME
			$CURL_HOME
			$NCURSES_HOME
			$OPENSSL_HOME
			$PYTHON_SYMLINKS_HOME
			$ANDROID_HOME/{tools,platform-tools}
			$path
		)

		manpath=(
			$GNU_COREUTILS_MAN_HOME
			$GNU_FINDUTILS_MAN_HOME
			$CURL_MAN_HOME
			$OPENSSL_MAN_HOME
			$manpath
		)
		;;
}

# Term
export TERM='xterm-256color'

# Default Editor
export EDITOR='nvim'

# Default Pager
export PAGER='less'

# Browser
export BROWSER='xdg-open'

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
eval $(dircolors --sh "$HOME/.dircolors")

# man
export MANWIDTH='100' # Fixed line width for man pages.
	if ([[ $OSTYPE =~ 'linux-android*' ]] 2>/dev/null) { MANWIDTH='50' }
export MANPAGER="nvim +'set filetype=man' -"
	if ([[ $OSTYPE =~ 'linux-android*' ]] 2>/dev/null) { unset MANPAGER }

# nvim
export NVIM_RPLUGIN_MANIFEST="$HOME/.vim/cache/share/rplugin.vim"
# export NVIM_NODE_LOG_FILE="$HOME/.vim/cache/log/node.log"
# export NVIM_NODE_LOG_LEVEL='debug'

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
export FZF_DEFAULT_COLORS='--color=dark,fg:7,fg+:7,bg:0,bg+:8,hl:4,hl+:4,info:8,border:8,prompt:4,pointer:3,marker:3,spinner:8,header:6'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_COLORS \
	--exact \
	--no-bold \
	--inline-info \
	--height='40%' \
	--jump-labels='bmvenritusldkfjgh' \
	--bind='ctrl-f:jump-accept'"

# transmission
export TR_AUTH='kutsan:EkYBoNSd6oIUznucRTfQTFCcxC5WeeDaBImPt6I9CncuY9g8mH'

# sdcv
export SDCV_PAGER='fold -s -w 100 | less'

# gcal
export GCAL="\
	--highlighting=\e[41m:\e[0m:\e[33m:\e[0m \
	--pager \
	--starting-day=Monday \
	--cc-holidays=TR"

# bat
export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"

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
export LESSOPEN="| bat %s 2>/dev/null" # Use `bat` program to syntax-wise highlight files.
export LESSHISTFILE="$HOME/.config/less/lesshistory" # Command and search history file.
export LESSKEYRC="$HOME/.config/less/lesskey" # Path of the uncompiled lesskey file.
export LESSKEY="$LESSKEYRC.lwc" # Path of the compiled lesskey file.
export LESS_TERMCAP_md=$'\e[01;34m' # Turn on bold mode.
export LESS_TERMCAP_me=$'\e[0m' # Turn off all attributes.
export LESS_TERMCAP_mh=$'\e[2m' # Turn on dim mode.
export LESS_TERMCAP_mr=$'\e[7m' # Turn on reverse mode.
export LESS_TERMCAP_se=$'\e[27;0m' # Exit standout mode.
export LESS_TERMCAP_so=$'\e[1;33m' # Begin standout mode.
export LESS_TERMCAP_ue=$'\e[24;0m' # Exit underline mode.
export LESS_TERMCAP_us=$'\e[4;1;38;5;250m' # Begin underline mode.
