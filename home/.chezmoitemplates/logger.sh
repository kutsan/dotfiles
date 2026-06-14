# shellcheck shell=bash

script_name='{{ .chezmoi.sourceFile | base | trimSuffix ".tmpl" }}'

_log() {
	local color=$1 stream=$2
	shift 2

	if [[ -t $stream ]]; then
		printf '\033[1;%sm==>\033[0m \033[1m[%s]\033[0m %s\n' "$color" "$script_name" "$*" >&"$stream"
	else
		printf '==> [%s] %s\n' "$script_name" "$*" >&"$stream"
	fi
}

log.info() { _log 34 1 "$@"; }
log.warn() { _log 33 2 "$@"; }
log.success() { _log 32 1 "$@"; }
