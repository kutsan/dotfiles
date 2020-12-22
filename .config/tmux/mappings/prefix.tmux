# Bind 'C-a C-a' to send 'C-a'.
bind-key -T prefix C-a send-prefix

# Reload configuration.
bind-key -T prefix r \
	source-file ~/.config/tmux/tmux.conf \; \
	display-message ' (!) ~/.config/tmux/tmux.conf reloaded.'

# Split panes with same directory.
bind-key -T prefix - split-window -v -c '#{pane_current_path}'
bind-key -T prefix \\ split-window -h -c '#{pane_current_path}'
bind-key -T prefix _ split-window -fv -c '#{pane_current_path}' # Full width.
bind-key -T prefix | split-window -fh -c '#{pane_current_path}' # Full height.

# Move panes.
bind-key -T prefix -r \{ swap-pane -U
bind-key -T prefix -r \} swap-pane -D

# Resize panes.
bind-key -T prefix -r H resize-pane -L 2
bind-key -T prefix -r J resize-pane -D 1
bind-key -T prefix -r K resize-pane -U 1
bind-key -T prefix -r L resize-pane -R 2

# Swap windows.
bind-key -T prefix -r '<' swap-window -d -t -1
bind-key -T prefix -r '>' swap-window -d -t +1

# Kill panes without prompt.
bind-key -T prefix x kill-pane

# Create a new window.
bind-key -T prefix c new-window

# Enter command prompt.
bind-key -T prefix : command-prompt

# Rename current window.
bind-key -T prefix , command-prompt -I '#W' "rename-window -- '%%'"

# Show clock.
bind-key -T prefix t clock-mode

# Launch tree mode.
bind-key -T prefix w choose-tree -Zw

# Toggle zoom current pane.
bind-key -T prefix z resize-pane -Z

# Prefix alternatives for root bindings.
bind-key -T prefix h select-pane -L
bind-key -T prefix j select-pane -D
bind-key -T prefix k select-pane -U
bind-key -T prefix l select-pane -R
bind-key -T prefix p select-window -p # Previous window.
bind-key -T prefix n select-window -n # Next window.
bind-key -T prefix v copy-mode
