#!/usr/bin/env bash
# shellcheck disable=SC1091,SC1090

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

script_dir="${BASH_SOURCE[0]%/*}"

(source "$script_dir/left/main.sh")
(source "$script_dir/center/main.sh")
(source "$script_dir/right/main.sh")

sketchybar --update
