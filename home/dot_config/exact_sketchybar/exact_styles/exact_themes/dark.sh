#!/usr/bin/env bash
# shellcheck disable=SC2034

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

readonly style_surface=0xff121212
readonly style_content=0xffe4e4e4
readonly style_content_muted=0xff7a7a7a
readonly style_accent=0xffffffff
readonly style_critical=0xffd75f5f
