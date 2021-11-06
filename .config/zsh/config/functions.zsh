##
# `cd` into the last directory upon exit.
##
function lf() {
  command lf -last-dir-path="$HOME/.local/share/lf/lastdir" "$@" \
    && cd "$(<$HOME/.local/share/lf/lastdir)" 2>/dev/null
}

##
# `oathtool` 2FA utility function.
##
function auth() {
  oathtool \
    --base32 \
    --totp \
    "$(gpg \
      --no-tty \
      --for-your-eyes-only \
      --quiet \
      --decrypt \
      ~/.config/auth/totp-$1.gpg)"
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

##
# Commit and push ledger journal updates.
##
function lpush() {
  cd ~/Projects/sync && \
    git add finance/journal-$(date +%Y).ledger && \
    git commit --message='finance: update journal file' && \
    git push origin master
}

function clear_clipboard() {
  unset should_clear
  vared -p '🧹 Clear clipboard? (Y/n): ' -c should_clear

  if (
    [[ "$should_clear" == 'y' ]] \
    || [[ "$should_clear" == 'Y' ]] \
    || [[ "$should_clear" == '' ]]
  ) {
    printf '' | pbcopy
    echo '✅ Clipboard cleared.'
  }

  unset should_clear
}

##
# Utility functions for bitwarden-cli.
##
function bwlogin() {
  bw login --code "$(auth bitwarden)" \
    "$(gpg --no-tty --for-your-eyes-only --quiet --decrypt ~/.config/auth/email.gpg 2>/dev/null)" \
    "$(gpg --no-tty --for-your-eyes-only --quiet --decrypt ~/.config/auth/bitwarden.gpg 2>/dev/null)"
}
function bwunlock() {
  export BW_SESSION="$(bw unlock --raw $(gpg --no-tty --for-your-eyes-only --quiet --decrypt ~/.config/auth/bitwarden.gpg 2>/dev/null))"
}
function bwget() {
  bwunlock && bw get password "$*" | pbcopy
  clear_clipboard
}
function bwcard() {
  bwunlock && bw get item "$*" | fx .card.number | pbcopy
  clear_clipboard
}
