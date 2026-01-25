# Check prompt installation.
if (! [[ -d "$XDG_DATA_HOME/zsh/plugins/pure" ]]) {
	return 1
}

# Add prompt to fpath.
fpath=($fpath "$XDG_DATA_HOME/zsh/plugins/pure")

# Prompt settings.
zstyle :prompt:pure:git:stash show yes

# Initialize the prompt system.
promptinit

# Prompt theme.
prompt pure

# Prompt styles.
zstyle :prompt:pure:prompt:error color 1
zstyle :prompt:pure:prompt:success color 15

# This clear screen widget allows Pure to re-render with its initial
# newline by manually clearing the screen and placing the cursor on
# line 4 so that the prompt is redisplayed on lines 2 and 3.
custom_prompt_pure_clear_screen() {
	# Enable output to terminal.
	zle -I

	# Clear screen and move cursor to (4, 0).
	print -n '\e[2J\e[4;0H'

	# Redraw prompt.
	zle .redisplay
}
zle -N clear-screen custom_prompt_pure_clear_screen
