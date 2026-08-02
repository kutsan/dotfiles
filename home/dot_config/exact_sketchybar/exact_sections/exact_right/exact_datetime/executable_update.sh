#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

readonly item_name="${NAME:?}"
readonly datetime_format='+%a %Y-%m-%d %H:%M'

sketchybar --set "$item_name" label="$(date "$datetime_format")"
