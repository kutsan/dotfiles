foreach piece (
	load.zsh
	exports.zsh
	prompt.zsh
	settings.zsh
	functions.zsh
	aliases.zsh
	widgets.zsh
	mappings.zsh
	plugins.zsh
) {
	source $ZDOTDIR/config/$piece
}
