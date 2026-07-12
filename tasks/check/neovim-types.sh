#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

readonly NVIM_CONFIG_DIR="home/dot_config/exact_nvim"

resolve_neovim_runtime_path() {
	nvim --clean --headless \
		--cmd 'lua io.write(vim.env.VIMRUNTIME)' \
		--cmd 'quit' 2>/dev/null
}

main() {
	local neovim_runtime_path
	neovim_runtime_path=$(resolve_neovim_runtime_path)

	VIMRUNTIME="$neovim_runtime_path" \
		lua-language-server --check "$NVIM_CONFIG_DIR"
}

main "$@"
