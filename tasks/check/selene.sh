#!/usr/bin/env bash

set -euo pipefail

find_selene_configs() {
	find . -name 'selene.toml' -type f -print0
}

lint_lua_directory() {
	local config=$1
	local dir

	dir=$(dirname -- "$config")
	(cd -- "$dir" && selene .)
}

main() {
	while IFS= read -r -d '' config; do
		lint_lua_directory "$config"
	done < <(find_selene_configs)
}

main
