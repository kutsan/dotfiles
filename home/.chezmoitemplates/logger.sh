# shellcheck shell=bash

readonly script_name='{{ .chezmoi.sourceFile | base | trimSuffix ".tmpl" }}'

_cursor_col() {
	local col=

	# -icanon delivers bytes immediately without buffering until newline
	# -echo suppresses the terminal from printing the response to the screen
	stty -icanon -echo </dev/tty 2>/dev/null
	printf '\033[6n' >/dev/tty                                # ANSI DSR: request cursor position
	IFS='[;' read -rsd 'R' -t 1 _ _ col </dev/tty 2>/dev/null # response format: ESC[row;colR
	stty icanon echo </dev/tty 2>/dev/null

	# Guard against garbled response
	if [[ ! $col =~ ^[0-9]+$ ]]; then
		col=1
	fi

	printf '%s' "$col"
}

_log() {
	local -r color=$1 stream=$2
	shift 2

	if [[ -t $stream ]]; then
		if [[ $(_cursor_col) -gt 1 ]]; then
			printf '\n' >&"$stream"
		fi

		printf '\033[1;%sm==>\033[0m \033[1m[%s]\033[0m %s\n' "$color" "$script_name" "$*" >&"$stream"
	else
		printf '==> [%s] %s\n' "$script_name" "$*" >&"$stream"
	fi
}

log.info() { _log 34 1 "$@"; }
log.warn() { _log 33 2 "$@"; }
log.success() { _log 32 1 "$@"; }
