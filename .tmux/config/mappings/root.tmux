# Switch panes.
bind-key -T root M-h select-pane -L
bind-key -T root M-j select-pane -D
bind-key -T root M-k select-pane -U
bind-key -T root M-l select-pane -R

# Switch windows.
bind-key -T root M-p select-window -t :- # Previous window.
bind-key -T root M-n select-window -t :+ # Next window.

# Toggle zoom.
bind-key -T root M-z resize-pane -Z

# Resize panes.
bind-key -T root M-H resize-pane -L 2
bind-key -T root M-J resize-pane -D 1
bind-key -T root M-K resize-pane -U 1
bind-key -T root M-L resize-pane -R 2

# Enter copy mode.
bind-key -T root M-v copy-mode
