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
	oathtool --base32 --totp "$(gpg --no-tty --for-your-eyes-only --quiet --decrypt ~/.auth/totp-$1.gpg)"
}
