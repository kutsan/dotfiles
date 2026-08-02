#!/usr/bin/env bash
# shellcheck disable=SC1091,SC1090

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

script_dir="${BASH_SOURCE[0]%/*}"

for section in left q e right; do
	(source "$script_dir/$section/main.sh" "$section")
done

sketchybar --update
