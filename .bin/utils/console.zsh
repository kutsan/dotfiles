#!/usr/bin/env zsh

##
# Utility functions for logging to standard output.
#
# @author Kutsan Kaplan <me@kutsankaplan.com>
# @license GPLv3
# @version v0.1.0
##

function _initialize_colors() {
	setopt LOCAL_OPTIONS UNSET

	if [[ "$color" == '' ]] 2>/dev/null {
		autoload -U colors && colors
	}
}
_initialize_colors

function console.error() {
	echo -e "  ${bg[red]}${fg[white]} ERROR ${reset_color} $1" >&2

	local i=''
	for (( i=2; i <= ${#@}; i++ )) {
		eval "local arg=\$$i"
		echo "          $arg" >&2
	}
}

function console.warn() {
	echo -e "  ${bg[yellow]}${bold_color}${fg[black]} WARN ${reset_color} $1" >&2

	local i=''
	for (( i=2; i <= ${#@}; i++ )) {
		eval "local arg=\$$i"
		echo "         $arg" >&2
	}
}

function console.info() {
	echo -e "  ${bg[white]}${bold_color}${fg[black]} INFO ${reset_color} $1"

	local i=''
	for (( i=2; i <= ${#@}; i++ )) {
		eval "local arg=\$$i"
		echo "         $arg"
	}
}
