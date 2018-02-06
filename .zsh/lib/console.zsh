#!/usr/bin/env zsh

##
# Utility functions for logging to standard output.
#
# @author Kutsan Kaplan <me@kutsankaplan.com>
# @license GPLv3
# @version v0.1.0
##

# Initialize colors.
function () {
	setopt LOCAL_OPTIONS UNSET

	if [[ "$color" == '' ]] 2>/dev/null {
		autoload -U colors && colors
	}
}

function console.error() {
	echo -e "  ${bg[red]}${fg[white]} error ${reset_color} $1" >&2

	local i=''
	for (( i=2; i <= ${#@}; i++ )) {
		eval "local arg=\$$i"
		echo "          $arg" >&2
	}
}

function console.warn() {
	echo -e "  ${bg[yellow]}${bold_color}${fg[black]} warn ${reset_color} $1" >&2

	local i=''
	for (( i=2; i <= ${#@}; i++ )) {
		eval "local arg=\$$i"
		echo "         $arg" >&2
	}
}

function console.info() {
	if [[ "$1" == '--with-date' ]] {
		shift
		echo -e "  ${bg[white]}${bold_color}${fg[black]} info ${reset_color} ${bold_color}$(date +'%Y-%m-%d %H:%M:%S')${reset_color} $1"
	} else {
		echo -e "  ${bg[white]}${bold_color}${fg[black]} info ${reset_color} $1"
	}

	local i=''
	for (( i=2; i <= ${#@}; i++ )) {
		eval "local arg=\$$i"
		echo "         $arg"
	}
}
