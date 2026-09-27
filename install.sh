#!/usr/bin/env sh
# shellcheck disable=SC3043 # `local` is supported by every real /bin/sh.

set -o errexit -o nounset

resolve_script_dir() {
	(cd -P -- "$(dirname -- "$(command -v -- "$1")")" && pwd -P)
}

download_chezmoi() {
	local bin_dir_path=$1

	if ! command -v curl >/dev/null; then
		printf 'To install chezmoi, you must have curl installed.\n' >&2
		return 1
	fi

	local chezmoi_install_script
	chezmoi_install_script="$(
		curl \
			--fail \
			--silent \
			--show-error \
			--location \
			--proto '=https' \
			https://get.chezmoi.io
	)"
	sh -c "${chezmoi_install_script}" -- -b "${bin_dir_path}" >&2
}

main() {
	local script_dir_path
	script_dir_path="$(resolve_script_dir "$0")"

	local tmp_dir_path
	tmp_dir_path="$(mktemp -d)"

	# shellcheck disable=SC2064 # Expand `tmp_dir_path` now, it is out of scope on exit.
	trap "rm -rf -- '${tmp_dir_path}'" EXIT
	trap 'exit 130' INT
	trap 'exit 143' TERM

	printf 'Downloading chezmoi to %s\n' "${tmp_dir_path}" >&2
	download_chezmoi "${tmp_dir_path}"

	set -- init --apply --source="${script_dir_path}"

	printf "Running 'chezmoi %s'\n" "$*" >&2
	"${tmp_dir_path}/chezmoi" "$@"
}

main
