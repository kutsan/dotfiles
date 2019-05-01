# newsboat
bind-key -n M-N \
	new-window -n newsboat newsboat --quiet \; \
	split-window -t newsboat -h -l 55 -c $HOME/.newsboat \; \
	select-pane -L \; \
	set-window-option allow-rename off \; \
	rename-window newsboat

# stig
bind-key -n M-S \
	new-window -n stig stig \; \
	split-window -t stig -v -l 25 -c $HOME/Downloads \; \
	send-keys -t stig 'ranger' 'Enter' \; \
	select-pane -t stig -U \; \
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
bind-key -n M-H \
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

# ranger
bind-key -n M-R \
	new-window -n file "ranger" \; \
	set-window-option allow-rename off \; \
	rename-window file
