#!/usr/bin/env bash

set -o noclobber -o noglob -o nounset -o pipefail
IFS=$'\n'

# Meanings of exit codes
#
# Code | Meaning	| Action of ranger
# -----+------------+-------------------------------------------
# 0    | success	| Display stdout as preview.
# 1    | no preview | Display no preview at all.
# 2    | plain text | Display the plain content of the file.
# 3    | fix width	| Don't reload when width changes.
# 4    | fix height | Don't reload when height changes.
# 5    | fix both	| Don't ever reload.
# 6    | image		| Display the image `$IMAGE_CACHE_PATH`.
# 7    | image		| Display the file directly as an image.

# Script arguments
declare -g FILE_PATH="${1}" # Full path of the highlighted file.
declare -g PV_WIDTH="${2}" # Width of the preview pane (number of fitting characters).
declare -g PV_HEIGHT="${3}" # Height of the preview pane (number of fitting characters).
declare -g IMAGE_CACHE_PATH="${4}" # Full path that should be used to cache image preview.
declare -g PV_IMAGE_ENABLED="${5}" # 'True' if image previews are enabled, 'False' otherwise.

declare -g FILE_EXTENSION="${FILE_PATH##*.}"
declare -g FILE_EXTENSION_LOWER="${FILE_EXTENSION,,}"
declare -g FILE_MIMETYPE="$(file --dereference --brief --mime-type -- "${FILE_PATH}")"

handle_extension() {
	case "${FILE_EXTENSION_LOWER}" in
		zip)
			unzip -l -- "${FILE_PATH}" \
				&& exit 5

			exit 1
			;;

		tar | gz)
			tar tvvf "${FILE_PATH}" \
				&& exit 5

			exit 1
			;;

		pdf)
			exiftool "${FILE_PATH}" \
				&& exit 5

			exit 1
			;;

		torrent)
			transmission-show -- "${FILE_PATH}" \
				&& exit 5

			exit 1
			;;
	esac
}

handle_image() {
	if [[ "${PV_IMAGE_ENABLED}" != 'True' ]]; then
		return 1
	fi

	case "$FILE_MIMETYPE" in
		image/*)
			exit 7
			;;

		video/*)
			ffmpegthumbnailer -i "${FILE_PATH}" -o "${IMAGE_CACHE_PATH}" -s 0 \
				&& exit 6

			exit 1
			;;
	esac
}

handle_mime() {
	case "$FILE_MIMETYPE" in
		text/* | */xml)
			# Don't try to highlight big files.
			(( "$(stat --printf='%s' -- "${FILE_PATH}")" > "262143" )) \
				&& exit 1

			cat "${FILE_PATH}" \
				&& exit 5

			exit 2
			;;

		image/*)
			exiftool "${FILE_PATH}" \
				&& exit 5

			exit 1
			;;

		video/* | audio/*)
			exiftool "${FILE_PATH}" \
				&& exit 5

			exit 1
			;;
	esac
}

print_fileinfo() {
	printf '%s: %s\n\n' \
		"$FILE_MIMETYPE" \
		"$(file --dereference --brief -- ${FILE_PATH})"
}

main() {
	print_fileinfo

	handle_extension
	handle_image
	handle_mime

	exit 5
}
main
