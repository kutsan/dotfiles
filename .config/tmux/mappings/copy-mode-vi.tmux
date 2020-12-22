# Navigation
bind-key -T copy-mode-vi h send-keys -X cursor-left
bind-key -T copy-mode-vi j send-keys -X cursor-down
bind-key -T copy-mode-vi k send-keys -X cursor-up
bind-key -T copy-mode-vi l send-keys -X cursor-right
bind-key -T copy-mode-vi H send-keys -X top-line
bind-key -T copy-mode-vi M send-keys -X middle-line
bind-key -T copy-mode-vi L send-keys -X bottom-line
bind-key -T copy-mode-vi ^ send-keys -X back-to-indentation
bind-key -T copy-mode-vi $ send-keys -X end-of-line
bind-key -T copy-mode-vi w send-keys -X next-word
bind-key -T copy-mode-vi W send-keys -X next-space
bind-key -T copy-mode-vi b send-keys -X previous-word
bind-key -T copy-mode-vi B send-keys -X previous-space
bind-key -T copy-mode-vi e send-keys -X next-word-end
bind-key -T copy-mode-vi E send-keys -X next-space-end
bind-key -T copy-mode-vi g send-keys -X history-top
bind-key -T copy-mode-vi G send-keys -X history-bottom
bind-key -T copy-mode-vi % send-keys -X next-matching-bracket
bind-key -T copy-mode-vi \{ send-keys -X previous-paragraph
bind-key -T copy-mode-vi \} send-keys -X next-paragraph

# Escape
bind-key -T copy-mode-vi Escape send-keys -X cancel
bind-key -T copy-mode-vi C-c send-keys -X clear-selection

# Scroll
bind-key -T copy-mode-vi C-u send-keys -X halfpage-up
bind-key -T copy-mode-vi C-d send-keys -X halfpage-down
bind-key -T copy-mode-vi C-y send-keys -X scroll-up
bind-key -T copy-mode-vi C-e send-keys -X scroll-down
bind-key -T copy-mode-vi C-b send-keys -X page-up
bind-key -T copy-mode-vi C-f send-keys -X page-down

# Select
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi V send-keys -X select-line
bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
bind-key -T copy-mode-vi o send-keys -X other-end
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -i -selection clipboard'

# Search
bind-key -T copy-mode-vi / command-prompt -i -p '/' 'send-keys -X search-backward-incremental "%%%"'
bind-key -T copy-mode-vi ? command-prompt -i -p '?' 'send-keys -X search-forward-incremental "%%%"'
bind-key -T copy-mode-vi n send-keys -X search-again
bind-key -T copy-mode-vi N send-keys -X search-reverse
bind-key -T copy-mode-vi \; send-keys -X jump-again
bind-key -T copy-mode-vi , send-keys -X jump-reverse
bind-key -T copy-mode-vi \# send-keys -FX search-backward "#{copy_cursor_word}"
bind-key -T copy-mode-vi * send-keys -FX search-forward "#{copy_cursor_word}"
bind-key -T copy-mode-vi f command-prompt -1 "send -X jump-forward \"%%%\""
bind-key -T copy-mode-vi F command-prompt -1 "send -X jump-backward \"%%%\""
bind-key -T copy-mode-vi t command-prompt -1 "send -X jump-to-forward \"%%%\""
bind-key -T copy-mode-vi T command-prompt -1 "send -X jump-to-backward \"%%%\""
