#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
shopt -s nullglob
IFS=$'\n\t'

main() {
	local theme_dir template
	theme_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)

	cd -- "$theme_dir/../.."

	for template in "$theme_dir"/templates/*.tera; do
		whiskers "$template" \
			--color-overrides "$theme_dir/palette.json" \
			--overrides "$theme_dir/palette.json"
	done
}

main "$@"
