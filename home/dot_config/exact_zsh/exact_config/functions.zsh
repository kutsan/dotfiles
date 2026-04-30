# `cd` into the last directory upon exit using `yazi`.
y() {
	local temp_file="$(mktemp -t "yazi-cwd.XXXXXX")"

	command yazi "$@" --cwd-file="$temp_file"
	local cwd="$(command cat -- "$temp_file")"

	if [[ -n "$cwd" ]] && [[ "$cwd" != "$PWD" ]]; then
		builtin cd -- "$cwd"
	fi

	command rm -f -- "$temp_file"
}

# Generate authentication keys for SSH.
gen-ssh-keygen-ed25519() {
	ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/keys/$1 -C "$2"
}
