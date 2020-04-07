# neovim
bind-key -n M-V \
	new-window \; \
	send-keys 'v' 'Enter'

# newsboat
bind-key -n M-N \
	new-window \; \
	send-keys 'newsboat' 'Enter'

# stig
bind-key -n M-S \
	new-window \; \
	send-keys 'stig' 'Enter'

# trackma
bind-key -n M-T \
	new-window \; \
	send-keys 'trackma-curses' 'Enter' \; \
	split-window -v -l 20 -c $HOME/Downloads \; \
	send-keys "r --cmd='set viewmode!'" 'Enter'

# mutt
bind-key -n M-M \
	new-window \; \
	send-keys 'neomutt' 'Enter'

# htop
bind-key -n M-O \
	new-window -n htop htop \; \
	set-window-option allow-rename off \; \
	rename-window htop

# cal
bind-key -n M-C \
	new-window -n cal \
		"gcal \
			--highlighting='\e[41m:\e[0m:\e[33m:\e[0m' \
			--pager \
			--starting-day=1 \
			--cc-holidays=TR \
			$(date +'%Y')" \; \
	set-window-option allow-rename off \; \
	rename-window cal
