#!/usr/bin/env zsh

typeset -g FILE_PATH="$1"
typeset -g PREVIEW_HEIGHT="$2"
typeset -g FILE_MIMETYPE="$(file --dereference --brief --mime-type -- "${FILE_PATH}")"

function handle_preview() {
  case "$FILE_MIMETYPE" {
    text/* | */xml) cat "${FILE_PATH}" ;;
    application/zip) unzip -l -- "${FILE_PATH}" ;;
    application/*gzip) tar tvvf "${FILE_PATH}" ;;
    application/x-bittorrent) transmission-show -- "${FILE_PATH}" ;;
  }
}

function main() {
  # Print MIME type.
  printf '%s: %s\n⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻\n\n' \
    "$FILE_MIMETYPE" \
    "$(file --dereference --brief -- ${FILE_PATH})"

  # Skip files over 10MB but only within `lf`.
  local file_size=$(stat --printf='%s' -- "${FILE_PATH}")
  if ([[ "$PREVIEW_HEIGHT" != '' ]] && (( $file_size > 10000000 ))) {
    return 1
  }

  # Show preview of the file.
  handle_preview

  # Show additional EXIF data only inside `less`.
  if ([[ "$PREVIEW_HEIGHT" == '' ]]) {
    printf '\n⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻\n'
    exiftool "${FILE_PATH}"
  }
}
main
