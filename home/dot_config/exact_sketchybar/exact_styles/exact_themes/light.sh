#!/usr/bin/env bash
# shellcheck disable=SC2034

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

readonly style_surface=0xffededed
readonly style_content=0xff1b1b1b
readonly style_content_muted=0xff6e6e6e
readonly style_accent=0xff000000
readonly style_critical=0xffbc2f2f
