# newsboat
bind-key -n M-N \
	new-window -n newsboat newsboat --quiet \; \
	split-window -h -l 55 '' \; \
	select-pane -L \; \
	set-window-option allow-rename off \; \
	rename-window newsboat

# stig
bind-key -n M-S \
	new-window -n stig stig \; \
	split-window -v -l 25 -c $HOME/Downloads \; \
	send-keys 'ranger' 'Enter' \; \
	select-pane -U \; \
	set-window-option allow-rename off \; \
	rename-window stig

# trackma
bind-key -n M-T \
	new-window -n trackma trackma-curses \; \
	split-window -h -l 55 -c $HOME/Downloads \; \
	send-keys "r --cmd='set viewmode!'" 'Enter' \; \
	select-pane -L \; \
	set-window-option allow-rename off \; \
	rename-window trackma

# htop
bind-key -n M-O \
	new-window -n htop htop \; \
	set-window-option allow-rename off \; \
	rename-window htop

# mutt
bind-key -n M-M \
	new-window -n mail neomutt \; \
	set-window-option allow-rename off \; \
	rename-window mail

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
