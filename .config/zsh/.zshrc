foreach file (
  load.zsh
  exports.zsh
  prompt.zsh
  settings.zsh
  functions.zsh
  aliases.zsh
  mappings.zsh
  plugins.zsh
) {
  source $ZDOTDIR/config/$file
}
unset file
