# shellcheck shell=bash

# Scripts can run from a shell that has not loaded `.zshenv` yet, like the
# first `install.sh` run on a fresh machine.

if [[ $OSTYPE == darwin* ]]; then
	HOMEBREW_NO_ANALYTICS=1
	export HOMEBREW_NO_ANALYTICS

	PATH="/opt/homebrew/bin:/opt/homebrew/sbin:${PATH}"
	export PATH
fi
