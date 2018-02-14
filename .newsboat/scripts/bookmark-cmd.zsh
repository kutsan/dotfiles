#!/usr/bin/env zsh

# Redirect all output to log file.
exec &>> ~/.newsboat/logs/$(basename $0).log

setopt ERR_EXIT PIPE_FAIL WARN_CREATE_GLOBAL WARN_NESTED_VAR

# Import utility functions for logging.
source ~/.zsh/lib/console.zsh

function handle_mime() {
	local mimetype="$1"

	case "$mimetype" {
		'application/x-bittorrent')
			# Append `.torrent` extension.
			command mv "$download_directory/$filename" "$download_directory/${filename}.torrent"
			typeset -g filename="$filename.torrent"

			# Start downloading torrent and remove torrent file.
			command transmission-remote --add "$download_directory/$filename"
			command rm "$download_directory/$filename"

			return 0
		;;

		*)
			# Do nothing special.
			return 0
		;;
	}
}

function main() {
	console.info --with-date 'Running.'

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
