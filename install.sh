#!/usr/bin/env sh
# shellcheck disable=SC3043 # `local` is supported by every real /bin/sh.

set -eu

ensure_chezmoi() {
	local chezmoi

	if chezmoi="$(command -v chezmoi)"; then
		printf '%s\n' "${chezmoi}"
		return 0
	fi

	local bin_dir="${HOME}/.local/bin"
	chezmoi="${bin_dir}/chezmoi"

	printf 'Installing chezmoi to %s\n' "${chezmoi}" >&2

	if ! command -v curl >/dev/null; then
		printf 'To install chezmoi, you must have curl installed.\n' >&2
		exit 1
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
	sh -c "${chezmoi_install_script}" -- -b "${bin_dir}" >&2

	printf '%s\n' "${chezmoi}"
}

main() {
	local chezmoi
	chezmoi="$(ensure_chezmoi)"

	# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
	local script_dir
	script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

	set -- init --apply --source="${script_dir}"

	printf "Running 'chezmoi %s'\n" "$*" >&2
	exec "${chezmoi}" "$@"
}

main "$@"
