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
