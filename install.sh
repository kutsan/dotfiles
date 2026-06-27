#!/bin/sh

set -eu

ensure_chezmoi() {
	if chezmoi="$(command -v chezmoi)"; then
		return 0
	fi

	bin_dir="${HOME}/.local/bin"
	chezmoi="${bin_dir}/chezmoi"

	printf 'Installing chezmoi to %s\n' "${chezmoi}" >&2

	if ! command -v curl >/dev/null; then
		printf 'To install chezmoi, you must have curl installed.\n' >&2
		exit 1
	fi

	chezmoi_install_script="$(curl -fsSL get.chezmoi.io)"
	sh -c "${chezmoi_install_script}" -- -b "${bin_dir}"
}

main() {
	ensure_chezmoi

	# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
	script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

	set -- init --apply --source="${script_dir}"

	printf "Running 'chezmoi %s'\n" "$*" >&2
	exec "${chezmoi}" "$@"
}

main "$@"
