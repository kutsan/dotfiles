# Core Shortcuts
alias ip='ip -color' # Use `ip` utility always with colors.
alias rm='trash' # Use `trash` program instead of built-in irrecoverable way to delete nodes.
alias mv='mv --interactive --verbose' # Move nodes with interactive mode and extra verbosity.
alias cp='cp --interactive --verbose' # Copy nodes with interactive mode and extra verbosity.
alias ln='ln --interactive --verbose' # Link nodes with interactive mode and extra verbosity.
alias mkdir='mkdir --parents' # Make missing parent directories when creating folders.
alias dirs='dirs -v -p' # Print directory stack with numbers and one directory per line.
alias grep='grep --color=auto --exclude-dir=".git" --exclude-dir="node_modules"' # Grep with colors and ignore common directories.
alias du='du --max-depth=1 --si' # Display size of files and folders under current directory.
alias df='df --all --si --print-type' # Display all disk usage statistics with SI units and FS types.
alias ls='ls --almost-all --classify --color=always --group-directories-first --literal' # List name of nodes.
alias lsa='ls -l --almost-all --si' # List nodes with their details.
alias path='print -l ${(s#:#)PATH}' # List entries in $PATH one path per line.
alias tmp='command mkdir --parents --verbose $TMPDIR/$(whoami) && cd $TMPDIR/$(whoami)' # Make temporary directory and cd into that.

# Custom Shortcuts
alias v='nvim'
alias g='git'
alias t='task'
alias mutt='neomutt'
alias note='$EDITOR +"cd ~/.notes/" ~/.notes/index.md'
alias tmux='tmux -f "$HOME/.tmux/tmux.conf"'
alias dfc='dfc -dmT'
alias syncthing='syncthing -home=$HOME/.config/syncthing'
alias la='exa --color=always --all --classify --group-directories-first --long --git --group'
alias jq='jq --tab --indent 4'
alias news='newsboat --quiet'
alias def='sdcv --color'
alias cal="gcal \
	--highlighting='\e[41m:\e[0m:\e[33m:\e[0m' \
	--pager \
	--starting-day=1 \
	--cc-holidays=TR \
	\$(date +'%Y')"
alias search="rg \
	--color='always' \
	--heading \
	--line-number \
	--no-messages \
	--no-ignore \
	--hidden \
	--follow \
	--smart-case \
	--glob '!{.git/*,node_modules/*}' \
	--regexp"

# Global Aliases
alias -g L='| less'
alias -g G='| grep'
alias -g NE='2>/dev/null' # No sterr.
alias -g NO='&>/dev/null' # No stout and sterr (shorthand for 1>/dev/null 2>&1).

# Configs
alias c-alacritty='$EDITOR +"cd ~/.config/alacritty/" ~/.config/alacritty/alacritty.yml'
alias c-browsersync='$EDITOR +"cd ~/.config/browsersync/" ~/.config/browsersync/config.js'
alias c-crontab='$EDITOR +"cd ~/.cron/" ~/.cron/crontab'
alias c-editorconfig='$EDITOR ~/.config/editorconfig/.editorconfig'
alias c-emacs='$EDITOR +"cd ~/.emacs.d/" ~/.emacs.d/init.el'
alias c-git='$EDITOR +"cd ~/.config/git/" ~/.config/git/config'
alias c-gpg='$EDITOR +"cd ~/.gnupg/" ~/.gnupg/gpg.conf'
alias c-less='$EDITOR +"cd ~/.config/less/" $HOME/.config/less/'
alias c-mailcap='$EDITOR +"cd ~/.mutt/" ~/.mutt/mailcap'
alias c-mpv='$EDITOR +"cd ~/.config/mpv/" ~/.config/mpv/'
alias c-mutt='$EDITOR +"cd ~/.mutt/" ~/.mutt/muttrc'
alias c-newsboat='$EDITOR +"cd ~/.newsboat/" ~/.newsboat/config'
alias c-ranger='$EDITOR +"cd ~/.config/ranger/" ~/.config/ranger/rc.conf'
alias c-ssh='$EDITOR +"cd ~/.ssh/" ~/.ssh/config'
alias c-stig='$EDITOR +"cd ~/.config/stig/" ~/.config/stig/rc'
alias c-task='$EDITOR ~/.taskrc'
alias c-termux='$EDITOR +"cd ~/.termux/" ~/.termux/'
alias c-tmux='$EDITOR +"cd ~/.tmux/" ~/.tmux/tmux.conf'
alias c-transmission='$EDITOR +"cd ~/.config/transmission/" ~/.config/transmission/settings.zsh'
alias c-vim='$EDITOR +"cd ~/.vim/" ~/.vim/init.vim'
alias c-wget='$EDITOR +"cd ~/.config/wget/" ~/.config/wget/wgetrc'
alias c-youtube-dl='$EDITOR +"cd ~/.config/youtube-dl/" ~/.config/youtube-dl/config'
alias c-zsh='$EDITOR +"cd $ZDOTDIR" $ZDOTDIR/.zshrc'
alias c-zshhistory='$EDITOR +"cd $ZDOTDIR" $HISTFILE'

# Git
foreach aliaskey (a b bl c co d ds dt l s sm) {
	alias g$aliaskey="git $aliaskey"
}
unset aliaskey
