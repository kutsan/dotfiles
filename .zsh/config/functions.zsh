##
# Makes directory and `cd`s into it.
#
# @param {string} $1 Directory name that will be created.
##
function take() {
	command mkdir --parents --verbose "$1" && cd "$1"
}

##
# `cd` into the last directory upon exit.
##
function r() {
	ranger $1 --choosedir=$RANGER_LAST_DIRECTORY_BUFFER \
		&& cd "$(<$RANGER_LAST_DIRECTORY_BUFFER)" 2>/dev/null
}

##
# Bookmark manager.
#
# @param {string} [$1] Defined bookmark string.
##
function b() {
	# Bookmarks
	local -A bookmarks=(
		'e' '~/Desktop/'
		'd' '~/Documents/'
		'w' '~/Downloads/'
		'i' '~/Pictures/'
		'p' '~/Projects/'
		'v' '~/Videos/'
		's' '~/Sync/'
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

		if ! (( $+commands[fzf] )) {
			return 1
		} else {
			selected_bookmark=$(
				printf "$bookmarks_table" \
				| fzf \
					--exact \
					--height='30%' \
					--preview='eval ls -l --si --almost-all --classify --color=always --group-directories-first --literal {2} 2>/dev/null' \
					--preview-window='right:60%' \
			)

			selected_bookmark="${selected_bookmark[(ws: :)2]}"
		}
	}

	if [[ "$selected_bookmark" != '' ]] {
		eval cd "$selected_bookmark"
	} else {
		return 1
	}
}
