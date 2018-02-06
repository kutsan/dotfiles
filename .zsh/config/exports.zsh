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
)

# Platform specific variables.
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

# dircolors
eval $(dircolors --sh "$HOME/.dircolors")

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

# crontab
export CRONTAB_HOME="$HOME/.cron"

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
export TRANSMISSION_HOME="$HOME/.config/transmission"

# highlight
export HIGHLIGHT_OPTIONS='--out-format="xterm256" --style="pablo"'

# less
source "$HOME/.config/less/lessrc" # Load core options.
export LESSHISTFILE="$HOME/.config/less/lesshistory" # Command and search history file.
export LESSKEYRC="$HOME/.config/less/lesskey" # Path of the uncompiled lesskey file.
export LESSKEY="$LESSKEYRC.lwc" # Path of the compiled lesskey file.

# sdcv
export SDCV_PAGER='fold -s -w 100 | less'

# Clear utility function.
unset -f find_alternative
