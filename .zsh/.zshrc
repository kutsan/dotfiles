foreach piece (
	load.zsh
	exports.zsh
	hooks.zsh
	prompt.zsh
	settings.zsh
	multiplexer.zsh
	functions.zsh
	aliases.zsh
	widgets.zsh
	mappings.zsh
	plugins.zsh
) {
	source $ZDOTDIR/config/$piece
}
