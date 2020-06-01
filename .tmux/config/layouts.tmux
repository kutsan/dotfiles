# stig
bind-key -n M-S \
	new-window \; \
	send-keys 'stig' 'Enter'

# trackma
bind-key -n M-T \
	new-window \; \
	send-keys 'trackma-curses' 'Enter'

# neomutt
bind-key -n M-M \
	new-window \; \
	send-keys 'neomutt' 'Enter'

# htop
bind-key -n M-O \
	new-window -n htop htop \; \
	set-window-option allow-rename off \; \
	rename-window htop

# gcal
bind-key -n M-C \
	new-window -n gcal \
		"gcal \
			--highlighting='\e[41m:\e[0m:\e[33m:\e[0m' \
			--pager \
			--starting-day=1 \
			$(date +'%Y')" \; \
	set-window-option allow-rename off \; \
	rename-window gcal
