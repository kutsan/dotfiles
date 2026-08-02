#!/usr/bin/env bash
# shellcheck disable=SC1091,SC1090

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

if [ -n "${style_loaded:-}" ]; then
	return 0
fi
readonly style_loaded=1

script_dir="${BASH_SOURCE[0]%/*}"

source "$script_dir/themes/dark.sh"
source "$script_dir/tokens.sh"
