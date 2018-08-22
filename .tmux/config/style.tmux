# Mode
set-option -g mode-bg brightblack
set-option -g mode-fg default

# Use top tabbar
set-option -g status-position top

# Status update interval
set-option -g status-interval 5

# Basic status bar colors
set-option -g status-bg default
set-option -g status-fg white

# Left side of status bar
set-option -g status-left-length 40
set-option -g status-left '#[fg=brightwhite,bg=brightblack] #S #[fg=default,bg=default] '

# Window status
set-option -g window-status-format '#[fg=white,bg=brightblack] #I #[fg=white,bg=black] #W '
set-option -g window-status-current-format '#[fg=brightblack,bg=blue] #I #[fg=brightblack,bg=magenta] #W '
set-option -g window-status-separator " "
set-option -g status-justify left

# Right side of status bar
set-option -g status-right-length 40
set-option -g status-right ' #[fg=white,bg=black] %Y-%m-%d %R #[fg=white,bg=brightblack] #(whoami)@#h '

# Pane border
set-option -g pane-border-bg default
set-option -g pane-border-fg black
set-option -g pane-active-border-bg default
set-option -g pane-active-border-fg white

# Pane number indicator
set-option -g display-panes-colour brightblack
set-option -g display-panes-active-colour brightwhite

# Clock mode
set-option -g clock-mode-colour white
set-option -g clock-mode-style 24

# Message
set-option -g message-bg default
set-option -g message-fg default
