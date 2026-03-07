# Register widgets.
foreach widget (
	'add-surround surround'
	'delete-surround surround'
	'change-surround surround'
	select-bracketed
	select-quoted
) {
	eval zle -N $widget
}
unset widget

# Insert Mode
bindkey -M viins '^K' atuin-up-search-viins # Override `up-history` to use Atuin search.
bindkey -M viins '^J' down-history
bindkey -M viins '^F' vi-forward-char
bindkey -M viins '^U' backward-kill-line
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^[[3~' delete-char

# Normal Mode
bindkey -M vicmd 'j' down-line # Override `down-line-or-history`.
bindkey -M vicmd 'k' up-line # Override `up-line-or-history`.
bindkey -M vicmd 'sr' change-surround
bindkey -M vicmd 'sd' delete-surround
bindkey -M vicmd 'sa' add-surround

# Visual Mode
bindkey -M visual 'sa' add-surround
foreach char ({a,i}{\',\",\`}) { bindkey -M visual $char select-quoted } && unset char
foreach char ({a,i}${(s..)^:-'()[]{}<>bB'}) { bindkey -M visual $char select-bracketed } && unset char

# Operator Mode
foreach char ({a,i}{\',\",\`}) { bindkey -M viopp $char select-quoted } && unset char
foreach char ({a,i}${(s..)^:-'()[]{}<>bB'}) { bindkey -M viopp $char select-bracketed } && unset char

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
	print -n '\e[2J\e[4;0H'

	# Redraw prompt.
	zle .redisplay
}
zle -N clear-screen custom_prompt_pure_clear_screen
