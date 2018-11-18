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
FILE_PATH="${1}" # Full path of the highlighted file
PV_WIDTH="${2}" # Width of the preview pane (number of fitting characters)
PV_HEIGHT="${3}" # Height of the preview pane (number of fitting characters)
IMAGE_CACHE_PATH="${4}" # Full path that should be used to cache image preview
PV_IMAGE_ENABLED="${5}" # 'True' if image previews are enabled, 'False' otherwise.

FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION_LOWER="${FILE_EXTENSION,,}"

handle_extension() {
	case "${FILE_EXTENSION_LOWER}" in
		a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
		rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
			atool --list -- "${FILE_PATH}" && exit 5

			exit 1
			;;

		rar)
			# Avoid password prompt by providing empty password
			unrar lt -p- -- "${FILE_PATH}" && exit 5

			exit 1
			;;

		7z)
			# Avoid password prompt by providing empty password
			7z l -p -- "${FILE_PATH}" && exit 5

			exit 1
			;;

		pdf)
			# Preview as text conversion
			pdftotext -l 10 -nopgbrk -q -- "${FILE_PATH}" - && exit 5
			exiftool "${FILE_PATH}" && exit 5

			exit 1
			;;

		torrent)
			transmission-show -- "${FILE_PATH}" && exit 5

			exit 1
			;;

		odt|ods|odp|sxw)
			# Preview as text conversion
			odt2txt "${FILE_PATH}" && exit 5

			exit 1
			;;
	esac
}

handle_image() {
	local mimetype="${1}"

	case "${mimetype}" in
		image/*)
			exit 7
			;;

		video/*)
			ffmpegthumbnailer -i "${FILE_PATH}" -o "${IMAGE_CACHE_PATH}" -s 0 && echo
			;;
	esac
}

handle_mime() {
	local mimetype="${1}"

	case "${mimetype}" in
		text/* | */xml)
			# Don't try to highlight big files.
			(( "$(stat --printf='%s' -- "${FILE_PATH}")" > "262143" )) && exit 2

			bat "${FILE_PATH}" && exit 5

			exit 2
			;;

		image/*)
			exiftool "${FILE_PATH}" && exit 5

			exit 1
			;;

		video/* | audio/*)
			exiftool "${FILE_PATH}" && exit 5

			exit 1
			;;
	esac
}

handle_fallback() {
	file --dereference --brief -- "${FILE_PATH}" && exit 5

	exit 1
}

handle_extension
MIMETYPE="$( file --dereference --brief --mime-type -- "${FILE_PATH}" )"
[[ "${PV_IMAGE_ENABLED}" == 'True' ]] && handle_image "${MIMETYPE}"
handle_mime "${MIMETYPE}"
handle_fallback

exit 1
