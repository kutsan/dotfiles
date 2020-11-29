# Unbind all default bindings.
unbind-key -T prefix -a
unbind-key -T root -a
unbind-key -T copy-mode -a
unbind-key -T copy-mode-vi -a

# Set default prefix.
set-option -g prefix C-a

# Start with non-login shell.
set-option -g default-command "$SHELL"

# Default term.
set-option -g default-terminal "tmux-256color"

# Enable vi style key bindings in command mode.
set-option -g mode-keys vi
set-option -g status-keys vi

# Mouse support.
set-option -g mouse on

# Time in milliseconds for which tmux waits after an escape.
set-option -g escape-time 0

# Keep commands history and set its limit.
set-option -g history-file ~/.tmux/cache/history
set-option -g history-limit 10000

# Start window numbers at 1 to match keyboard order with tmux window order.
set-option -g base-index 1
set-option -g pane-base-index 1

# Renumber windows sequentially after closing any of them.
set-option -g renumber-windows on

# Allow programs to change title using a escape sequence.
set-option -g allow-rename on

# Don't show "Activity in window X" messages.
set-option -g visual-activity off

# Enable supported focus events.
set-option -g focus-events on

# Turn on automatic window renaming.
set-option -g automatic-rename on

# Terminal overrides.
set-option -g -a terminal-overrides ',xterm-256color:Tc' # True color support.
