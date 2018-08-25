# Unbind default prefix.
unbind-key C-b

# Bind 'C-a C-a' to send 'C-a'.
bind-key C-a send-prefix

# Reload configuration.
bind-key r \
	source-file ~/.tmux/tmux.conf \; \
	display-message ' (!) ~/.tmux/tmux.conf reloaded.'

# Switch panes.
bind-key -n M-h select-pane -L
bind-key -n M-j select-pane -D
bind-key -n M-k select-pane -U
bind-key -n M-l select-pane -R

# Switch windows.
bind-key -n M-p select-window -t :- # Previous window.
bind-key -n M-n select-window -t :+ # Next window.

# Toggle zoom.
bind-key -n M-z resize-pane -Z

# Split pane with same directory.
unbind-key '"'
unbind-key %
bind-key - split-window -v -c '#{pane_current_path}'
bind-key \ split-window -h -c '#{pane_current_path}'
bind-key _ split-window -fv -c '#{pane_current_path}' # Full width.
bind-key | split-window -fh -c '#{pane_current_path}' # Full height.

# Resize panes.
unbind-key C-Up
unbind-key C-Down
unbind-key C-Left
unbind-key C-Right
bind-key -n M-H resize-pane -L 2
bind-key -n M-J resize-pane -D 1
bind-key -n M-K resize-pane -U 1
bind-key -n M-L resize-pane -R 2

# Move panes.
unbind-key {
unbind-key }
bind-key -r H swap-pane -U
bind-key -r L swap-pane -D

# Kill panes without prompt.
bind-key X kill-pane

# Swap windows across themselves.
bind-key -r '<' swap-window -t -1
bind-key -r '>' swap-window -t +1

# Kill windows without prompt.
unbind-key &
bind-key x kill-window

# Enter copy mode.
unbind-key [
bind-key -n M-v copy-mode

# Select
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi V send-keys -X select-line
bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle

# Copy
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'clipboard' # Copy to system clipboard.
bind-key -T copy-mode-vi Y send-keys -X copy-pipe-and-cancel 'clipboard; tmux paste-buffer -s ""' # Copy and paste immediately to shell prompt.

# Paste
unbind-key ]
bind-key p paste-buffer -s '' # Paste without CR feed.
unbind-key =
bind-key P choose-buffer "paste-buffer -b '%%' -s ''"

# Search
bind-key -T copy-mode-vi / command-prompt -i -p '/' 'send-keys -X search-forward-incremental "%%%"'
bind-key -T copy-mode-vi ? command-prompt -i -p '?' 'send-keys -X search-backward-incremental "%%%"'

# Jump search mode with prefix.
bind-key / copy-mode \; send-keys '/'
bind-key ? copy-mode \; send-keys '?'

# Quickly navigate up and down in visual mode.
bind-key -T copy-mode-vi K \
	send-keys -X cursor-up \; \
	send-keys -X cursor-up \; \
	send-keys -X cursor-up \; \
	send-keys -X cursor-up \; \
	send-keys -X cursor-up \;
bind-key -T copy-mode-vi J \
	send-keys -X cursor-down \; \
	send-keys -X cursor-down \; \
	send-keys -X cursor-down \; \
	send-keys -X cursor-down \; \
	send-keys -X cursor-down \;
