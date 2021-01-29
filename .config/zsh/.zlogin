# Data directory should be created manually since zsh doesn't conform to
# XDG Base Directory specification.
if (! [[ -d "$HOME/.local/share/zsh" ]]) {
  command mkdir --parent "$HOME/.local/share/zsh"
}

# Auto-attach tmux.
if ( \
  (( $+commands[tmux] )) \
  && ([[ $TMUX == '' ]] && [[ $SUDO_USER == '' ]] && [[ $SSH_CONNECTION == '' ]])
) {
  tmux attach-session -t 'main' 2>/dev/null && exit 0
  tmux new-session -s 'main' && exit 0
}

# Asynchronously zcompile .zcompdump file.
{
  typeset -g zcompdump="$HOME/.local/share/zsh/zcompdump"

  if ([[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]) {
    zcompile "$zcompdump"
  }
} &!
