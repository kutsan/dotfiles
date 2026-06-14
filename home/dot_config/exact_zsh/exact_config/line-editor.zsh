# Register widgets.
zle -N add-surround surround
zle -N delete-surround surround
zle -N change-surround surround
zle -N select-bracketed
zle -N select-quoted

# Insert Mode
bindkey -M viins '^K' atuin-up-search-viins # Override `up-history` to use Atuin search.
bindkey -M viins '^J' down-history
bindkey -M viins '^F' vi-forward-char
bindkey -M viins '^U' backward-kill-line
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^[[3~' delete-char

# Normal Mode
bindkey -M vicmd 'j' down-line # Override `down-line-or-history`.
bindkey -M vicmd 'k' up-line   # Override `up-line-or-history`.
bindkey -M vicmd 'sr' change-surround
bindkey -M vicmd 'sd' delete-surround
bindkey -M vicmd 'sa' add-surround

# Visual Mode
bindkey -M visual 'sa' add-surround

# Visual & Operator Mode
for prefix in a i; do
	for ch in "'" '"' '`'; do
		bindkey -M visual "${prefix}${ch}" select-quoted
		bindkey -M viopp "${prefix}${ch}" select-quoted
	done
done
for prefix in a i; do
	for ch in '(' ')' '[' ']' '{' '}' '<' '>' b B; do
		bindkey -M visual "${prefix}${ch}" select-bracketed
		bindkey -M viopp "${prefix}${ch}" select-bracketed
	done
done
unset prefix ch

# Completion Mode
bindkey -M menuselect '^?' undo
bindkey -M menuselect '^I' menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Clear screen widget that allows Pure prompt to re-render with
# its initial newline by manually clearing the screen and placing
# the cursor on line 4 so that the prompt is redisplayed on lines
# 2 and 3.
custom_prompt_pure_clear_screen() {
	# Enable output to terminal.
	zle -I

	# Clear screen and move cursor to (4, 0).
	printf '\e[2J\e[4;0H'

	# Redraw prompt.
	zle .redisplay
}
zle -N clear-screen custom_prompt_pure_clear_screen
