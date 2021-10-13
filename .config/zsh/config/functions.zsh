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
