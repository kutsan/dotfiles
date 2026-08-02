#!/usr/bin/env bash
# shellcheck disable=SC1091

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

script_dir="${BASH_SOURCE[0]%/*}"

(source "$script_dir/bar.sh")
(source "$script_dir/defaults.sh")
