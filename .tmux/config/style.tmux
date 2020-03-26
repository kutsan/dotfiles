# Mode
set-option -g mode-style bg=brightblack,fg=default

# Use top tabbar
set-option -g status-position top

# Status update interval
set-option -g status-interval 5

# Basic status bar colors
set-option -g status-style bg=default,fg=white

# Left side of status bar
set-option -g status-left-length 40
set-option -g status-left ' '

# Window status
set-option -g window-status-format '#[fg=brightblack,bg=default]  #W  '
set-option -g window-status-current-format '#[fg=black,bg=blue]  #W  '
set-option -g window-status-separator '  '
set-option -g status-justify left

# Right side of status bar
set-option -g status-right-length 40
set-option -g status-right ''

# Pane border
set-option -g pane-border-style bg=default,fg=black
set-option -g pane-active-border-style bg=default,fg=white

# Pane number indicator
set-option -g display-panes-colour brightblack
set-option -g display-panes-active-colour brightwhite

# Clock mode
set-option -g clock-mode-colour white
set-option -g clock-mode-style 24

# Message
set-option -g message-style bg=yellow,fg=black
