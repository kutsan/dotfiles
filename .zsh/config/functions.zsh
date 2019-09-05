##
# Makes directory and `cd`s into it.
#
# @param {string} $1 Directory name that will be created.
##
function take() {
	command mkdir --parents --verbose "$1" && cd "$1"
}

##
# `cd` into the last directory upon exit.
##
function r() {
	ranger $1 --choosedir=$RANGER_LAST_DIRECTORY_BUFFER \
		&& cd "$(<$RANGER_LAST_DIRECTORY_BUFFER)" 2>/dev/null
}

##
# `oathtool` 2FA utility function.
##
function auth() {
	oathtool --base32 --totp "$(gpg --no-tty --quiet --decrypt ~/.auth/totp-$1.gpg)"
}
