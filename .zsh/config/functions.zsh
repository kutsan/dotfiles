##
# Makes directory and `cd`s into it.
#
# @param {string} $1 Directory name that will be created.
##
function take() {
	command mkdir --parents --verbose "$1" && cd "$1"
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
			return 1
		} else {
			selected_bookmark=$(
				printf "$bookmarks_table" \
				| fzf \
					--exact \
					--height='30%' \
					--preview='eval ls --almost-all --classify --color=always --group-directories-first --literal $(echo {} | cut --delimiter=" " --fields=2 -) 2>/dev/null' \
					--preview-window='right:60%' \
				| cut --delimiter=' ' --fields=2
			)
		}
	}

	if [[ "$selected_bookmark" != '' ]] {
		eval cd "$selected_bookmark"
	} else {
		return 1
	}
}
