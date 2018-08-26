#!/usr/bin/env zsh

# Redirect all output to log file.
exec &>> ~/.newsboat/logs/$(basename $0).log

setopt ERR_EXIT PIPE_FAIL WARN_CREATE_GLOBAL WARN_NESTED_VAR

##
# Perform operations based on media type.
#
# @param {string} $1 MIME type.
##
function handle_mime() {
	local mimetype="$1"

	case "$mimetype" {
		*)
			# Do nothing special.
			return 0
		;;
	}
}

##
# @param {string} $1 Remote link.
# @param {string} $2 The title for the article.
##
function main() {
	echo "[$(date +'%Y-%m-%d %H:%M:%S')] Running."

	typeset -g link="$1"
	typeset -g filename="${2// /_}"
	typeset -g download_directory="$HOME/Downloads"

	# Download file to target location.
	wget "$link" \
		--timestamping \
		--no-show-progress \
		--output-document="$download_directory/$filename"

	# Perform operations based on media type.
	handle_mime "$(file --dereference --brief --mime-type -- "$download_directory/$filename")"
}
main "$@"
