# Import general error and warning notification utility functions.
source $ZDOTDIR/lib/console.zsh

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
	# Bookmarks
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
