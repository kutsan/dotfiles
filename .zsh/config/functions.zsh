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
#
# @param {string} [$1] Directory path which will cd into.
##
function r() {
	ranger "$1" --choosedir=$RANGER_LAST_DIRECTORY_BUFFER \
		&& cd "$(cat $RANGER_LAST_DIRECTORY_BUFFER)" 2>/dev/null
}

##
# Update global packages.
##
function update() {
	setopt LOCAL_OPTIONS XTRACE

	case $OSTYPE {
		darwin*)
			brew update
			brew upgrade
			brew cleanup
			;;
	}

	npm update --global
	npm install npm --global
}

##
# Update dotfiles submodules.
##
function update-submodules() {
	setopt LOCAL_OPTIONS XTRACE

	# Update them in home.
	cd $HOME

	# Update submodules.
	git submodule update --remote

	# Update vim tags.
	nvim --headless -c 'helptags ALL' -c 'quit'
}

##
# Return a most used directory or file.
##
function fz() {
	local selected_path=$(
		fasd -l \
		| sed "s#$HOME#~#" \
		| fzf \
			--exact \
			--tac \
			--no-sort \
			--prompt='fz ' \
			--preview-window='right:60%' \
			--preview=' \
				CURRENT_ITEM=$(echo {} | sed s#~#$HOME#) && \
				if [ -d $CURRENT_ITEM ]; then; \
					ls -l --si --almost-all --classify --color=always --group-directories-first --literal $CURRENT_ITEM; \
				else \
					bat $CURRENT_ITEM || cat {} 2>/dev/null; \
				fi \
			' \
	)

	# Expand ~ (tilde) variable.
	selected_path=$(eval echo "$selected_path")

	if ([[ -d "$selected_path" ]]) {
		cd "$selected_path"
	} else {
		$EDITOR "$selected_path"
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
		'e' '~/Desktop/'
		'd' '~/Documents/'
		'w' '~/Downloads/'
		'i' '~/Pictures/'
		'p' '~/Projects/'
		'v' '~/Videos/'
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
