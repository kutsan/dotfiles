#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

find_selene_configs() {
	find . -name 'selene.toml' -type f -print0
}

lint_lua_directory() {
	local -r config=$1
	local dir

	dir=$(dirname -- "$config")
	(cd -- "$dir" && selene .)
}

main() {
	local config

	while IFS= read -r -d '' config; do
		lint_lua_directory "$config"
	done < <(find_selene_configs)
}

main "$@"
