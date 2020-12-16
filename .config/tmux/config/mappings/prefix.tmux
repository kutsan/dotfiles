# Bind 'C-a C-a' to send 'C-a'.
bind-key -T prefix C-a send-prefix

# Reload configuration.
bind-key -T prefix r \
	source-file ~/.config/tmux/tmux.conf \; \
	display-message ' (!) ~/.config/tmux/tmux.conf reloaded.'

# Split pane with same directory.
bind-key -T prefix - split-window -v -c '#{pane_current_path}'
bind-key -T prefix \\ split-window -h -c '#{pane_current_path}'
bind-key -T prefix _ split-window -fv -c '#{pane_current_path}' # Full width.
bind-key -T prefix | split-window -fh -c '#{pane_current_path}' # Full height.

# Move panes.
bind-key -T prefix -r \{ swap-pane -U
bind-key -T prefix -r \} swap-pane -D

# Swap windows across themselves.
bind-key -T prefix -r '<' swap-window -d -t -1
bind-key -T prefix -r '>' swap-window -d -t +1

# Kill windows without prompt.
bind-key -T prefix x kill-window

# Kill panes without prompt.
bind-key -T prefix X kill-pane

# Make a new window.
bind-key -T prefix c new-window

# Jump search mode with prefix.
bind-key -T prefix / copy-mode \; send-keys '/'
bind-key -T prefix ? copy-mode \; send-keys '?'

# Launch command prompt.
bind-key -T prefix : command-prompt

# Rename current window.
bind-key -T prefix , command-prompt -I "#W" "rename-window -- '%%'"

# Show clock.
bind-key -T prefix t clock-mode

# Launch tree mode.
bind-key -T prefix w choose-tree -Zw

# Prefix alternates for root bindings.
bind-key -T prefix h select-pane -L
bind-key -T prefix j select-pane -D
bind-key -T prefix k select-pane -U
bind-key -T prefix l select-pane -R
bind-key -T prefix p select-window -t :- # Previous window.
bind-key -T prefix n select-window -t :+ # Next window.
bind-key -T prefix z resize-pane -Z
bind-key -T prefix H resize-pane -L 2
bind-key -T prefix J resize-pane -D 1
bind-key -T prefix K resize-pane -U 1
bind-key -T prefix L resize-pane -R 2
bind-key -T prefix v copy-mode
