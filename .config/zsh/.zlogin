# Data directory should be created manually since zsh doesn't conform to
# XDG Base Directory specification.
if (! [[ -d "$HOME/.local/share/zsh" ]]) {
  command mkdir --parent "$HOME/.local/share/zsh"
}

# Asynchronously zcompile .zcompdump file.
{
  typeset -g zcompdump="$HOME/.local/share/zsh/zcompdump"

  if ([[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]) {
    zcompile "$zcompdump"
  }
} &!
