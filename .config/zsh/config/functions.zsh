##
# `cd` into the last directory upon exit.
##
function lf() {
  command lf -last-dir-path="$HOME/.local/share/lf/lastdir" "$@" \
    && cd "$(<$HOME/.local/share/lf/lastdir)" 2>/dev/null
}

##
# Generate authentication keys for SSH.
##
function gen-ssh-keygen-ed25519() {
  ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/keys/$1 -C "$2"
}
