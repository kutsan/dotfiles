# Insert Mode
bindkey -M viins '^K' up-history
bindkey -M viins '^J' down-history
bindkey -M viins '^F' vi-forward-char
bindkey -M viins '^U' backward-kill-line
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^[[3~' delete-char
bindkey -M viins '^R' user-fuzzy-history
bindkey -M viins '^P' user-fuzzy-select

# Normal Mode
bindkey -M vicmd 'j' down-line # Override `down-line-or-history`.
bindkey -M vicmd 'k' up-line # Override `up-line-or-history`.
bindkey -M vicmd 'sr' change-surround
bindkey -M vicmd 'sd' delete-surround
bindkey -M vicmd 'sa' add-surround

# Visual Mode
bindkey -M visual 'sa' add-surround

# Completion Mode
bindkey -M menuselect '^?' undo
bindkey -M menuselect '^I' menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete
