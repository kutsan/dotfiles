##
# `cd` into the last directory upon exit using `yazi`.
##
function y() {
  local temp_file="$(mktemp -t "yazi-cwd.XXXXXX")" cwd

  command yazi "$@" --cwd-file="$temp_file"
  local cwd="$(command cat -- "$temp_file")"

  if ([[ -n "$cwd" ]] && [[ "$cwd" != "$PWD" ]]) {
    builtin cd -- "$cwd"
  }

  command rm -f -- "$temp_file"
}

##
# Generate authentication keys for SSH.
##
function gen-ssh-keygen-ed25519() {
  ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/keys/$1 -C "$2"
}
