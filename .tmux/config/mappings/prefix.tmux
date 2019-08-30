# Bind 'C-a C-a' to send 'C-a'.
bind-key -T prefix C-a send-prefix

# Reload configuration.
bind-key -T prefix r \
	source-file ~/.tmux/tmux.conf \; \
	display-message ' (!) ~/.tmux/tmux.conf reloaded.'

# Split pane with same directory.
bind-key -T prefix - split-window -v -c '#{pane_current_path}'
bind-key -T prefix \\ split-window -h -c '#{pane_current_path}'
bind-key -T prefix _ split-window -fv -c '#{pane_current_path}' # Full width.
bind-key -T prefix | split-window -fh -c '#{pane_current_path}' # Full height.

# Move panes.
bind-key -T prefix -r H swap-pane -U
bind-key -T prefix -r L swap-pane -D

# Swap windows across themselves.
bind-key -T prefix -r '<' swap-window -t -1
bind-key -T prefix -r '>' swap-window -t +1

# Paste
bind-key -T prefix p paste-buffer -s '' # Paste without CR feed.
bind-key -T prefix P choose-buffer "paste-buffer -b '%%' -s ''"

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

# Show clock.
bind-key -T prefix t clock-mode

# Launch tree mode.
bind-key -T prefix w choose-tree -Zw
