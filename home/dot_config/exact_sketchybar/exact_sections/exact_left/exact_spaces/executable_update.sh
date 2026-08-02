#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

readonly item_name="${NAME:?}"
readonly is_selected="${SELECTED:?}"

sketchybar --set "$item_name" icon.highlight="$is_selected"
