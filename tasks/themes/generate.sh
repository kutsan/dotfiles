#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
IFS=$'\n\t'

bash themes/poisonbloom/generate.sh
