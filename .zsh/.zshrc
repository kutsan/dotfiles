foreach piece (
	load.zsh
	multiplexer.zsh
	prompt.zsh
	exports.zsh
	options.zsh
	functions.zsh
	aliases.zsh
	widgets.zsh
	mappings.zsh
	plugins.zsh
) {
	source $ZDOTDIR/config/$piece
}
