##
# `oathtool` 2FA utility function.
##
function auth() {
	oathtool --base32 --totp "$(gpg --no-tty --for-your-eyes-only --quiet --decrypt ~/.auth/totp-$1.gpg)"
}

##
# Generate authentication keys for SSH.
##
function gen-ssh-keygen-ed25519() {
	ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/keys/$1 -C "$2"
}
function gen-ssh-keygen-rsa() {
	ssh-keygen -t rsa -o -a 100 -b 4096 -f ~/.ssh/keys/$1 -C "$2"
}
