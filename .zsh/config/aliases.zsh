# Core Shortcuts
alias s='sudo'
alias vim='nvim'
alias v='vim'
alias :q='exit'
alias c='clear'
alias ip='ip -color'
alias rm='trash' # Use `trash` program instead of sending anything to black hole.
alias mv='mv --interactive --verbose' # Prompt before overwriting anything and use extra verbosity.
alias cp='cp --interactive --verbose' # Prompt before overwriting anything and use extra verbosity.
alias ln='ln --interactive --verbose' # Prompt before overwriting anything and use extra verbosity.
alias mkdir='mkdir --parents' # Make parent directories as needed.
alias dirs='dirs -v -p' # Print directory stack with numbers and one directory per line.
alias grep='grep --color=auto --exclude-dir=".git" --exclude-dir="node_modules"' # Always use colors and ignore some directories.
alias du='du --max-depth=1 --si' # Display size of files and folders under current directory.
alias df='df --all --si --print-type' # Display all disk usage statistics with SI units, FS types.
alias h='fc -l -f -i' # Show history with ISO 8601 compatible history time stamp format.
alias ls='ls --almost-all --classify --color=always --group-directories-first --literal'
alias lsa='ls -l --almost-all --si' # List all files and folders.
alias lsd='ls --directory */ | command sed "s#//##"' # List only directories.
alias lsf='ls --almost-all -1 | command grep --invert-match "/$"' # List only files.
alias f='xdg-open "$PWD"' # Open current directory onto GUI file browser.
alias path="echo $PATH | cut --delimiter=':' --fields=1- --output-delimiter=$'\n'"

# Custom Shortcuts
alias t='task'
alias tmux='tmux -f "$HOME/.tmux/tmux.conf"'
alias dfc='dfc -dmT' # -d: Show used size. -m: Base 10 output. -T: Show file system types.
alias cdu='cdu --intelligent --log --reverse --sort --du h'
alias syncthing='syncthing -home=$HOME/.config/syncthing'
alias la='exa --color=always --all --classify --group-directories-first --long --git --group'
alias serve='browser-sync start --config ~/.config/browsersync/config.js'
alias jq='jq --tab --indent 4'
alias news='newsboat --quiet'
alias def='sdcv --color'
alias cal='gcal \
	--highlighting="$bg[red]:$reset_color:$fg[yellow]:$reset_color" \
	--pager \
	--starting-day=1 \
	--cc-holidays=TR \
	$(date +'%Y')'
alias search="rg \
	--color='always' \
	--heading \
	--line-number \
	--no-messages \
	--no-ignore \
	--hidden \
	--follow \
	--smart-case \
	--glob '!{.git/*,node_modules/*,$(basename $HISTFILE)}' \
	--regexp"

# Global Aliases
alias -g ND='*(/om[1])' # Newest directory.
alias -g NF='*(.om[1])' # Newest file.
alias -g L='| less'
alias -g H='--help | less'
alias -g V='| vim -R -' # Read-only Vim as pager.
alias -g G='| grep'
alias -g WC='| wc'
alias -g HE='| head'
alias -g TA='| tail'
alias -g NE='2>/dev/null' # No sterr.
alias -g NO='&>/dev/null' # No stout and sterr (shorthand for 1>/dev/null 2>&1).
alias -g AWK="| awk '{}'"
alias -g SED="| sed"
alias -g R='| rg'
alias -g F='| fzf'

# Configs
alias c-alacritty="$EDITOR +'cd ~/.config/alacritty/' ~/.config/alacritty/alacritty.yml"
alias c-browsersync="$EDITOR +'cd ~/.config/browsersync/' ~/.config/browsersync/config.js"
alias c-crontab="$EDITOR +'cd ~/.cron/' ~/.cron/crontab"
alias c-editorconfig="$EDITOR ~/.editorconfig"
alias c-emacs="$EDITOR +'cd ~/.emacs.d/' ~/.emacs.d/init.el"
alias c-git="$EDITOR +'cd ~/.config/git/' ~/.config/git/"
alias c-gpg="$EDITOR +'cd ~/.gnupg/' ~/.gnupg/gpg.conf"
alias c-htop="$EDITOR +'cd ~/.config/htop/' ~/.config/htop/htoprc"
alias c-karabiner="$EDITOR +'cd ~/.config/karabiner/' ~/.config/karabiner/karabiner.json"
alias c-less="$EDITOR +'cd ~/.config/less/' $HOME/.config/less/"
alias c-mac="$EDITOR +'cd ~/.config/macos/' ~/.config/macos/preferences.sh"
alias c-mailcap="$EDITOR +'cd ~/.mutt/' ~/.mutt/mailcap"
alias c-mpv="$EDITOR +'cd ~/.config/mpv/' ~/.config/mpv/"
alias c-mutt="$EDITOR +'cd ~/.mutt/' ~/.mutt/muttrc"
alias c-newsboat="$EDITOR +'cd ~/.newsboat/' ~/.newsboat/config"
alias c-ranger="$EDITOR +'cd ~/.config/ranger/' ~/.config/ranger/"
alias c-readme="$EDITOR ~/README.md"
alias c-ssh="$EDITOR +'cd ~/.ssh/' ~/.ssh/config"
alias c-stig="$EDITOR +'cd ~/.config/stig/' ~/.config/stig/rc"
alias c-task="$EDITOR ~/.taskrc"
alias c-termux="$EDITOR +'cd ~/.termux/' ~/.termux/"
alias c-tmux="$EDITOR +'cd ~/.tmux/' ~/.tmux/tmux.conf"
alias c-transmission="$EDITOR +'cd ~/.config/transmission/' ~/.config/transmission/settings.zsh"
alias c-vim="$EDITOR +'cd ~/.vim/' ~/.vim/init.vim"
alias c-wget="$EDITOR +'cd ~/.config/wget/' ~/.config/wget/wgetrc"
alias c-youtube-dl="$EDITOR +'cd ~/.config/youtube-dl/' ~/.config/youtube-dl/config"
alias c-zsh="$EDITOR +'cd $ZDOTDIR' $ZDOTDIR/.zshrc" r-zsh="source $ZDOTDIR/.zshrc"
alias c-zshenv="$EDITOR ~/.zshenv"
alias c-zshhistory="$EDITOR +'cd $ZDOTDIR' $HISTFILE"

# Git
alias g='git'
alias gs='git status -sb'
alias gf='git fetch'
alias gc='git commit'
alias gb='git branch'
alias gbl='git branch -vv -a'
alias gco='git checkout'
alias gsm='git submodule'
alias gd='git diff'
alias gdt='git difftool'
alias gds='git diff --staged'
alias gl='git log \
	--graph \
	--abbrev-commit \
	--decorate \
	--format=format:"%C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(blue)<%an>%C(reset)%C(bold yellow)%d%C(reset) %C(black)%ar%C(reset)" \
	--all'
alias glt='git log \
	--graph \
	--abbrev-commit \
	--decorate \
	--format=format:"%C(bold black)%ad%C(reset) %C(yellow)%h%C(reset) %C(white)%s%C(reset) %C(blue)<%an>%C(reset)%C(bold yellow)%d%C(reset) %C(black)%ar%C(reset)" \
	--date=format:"%Y-%m-%d %H:%M" \
	--all'
function ga() { git add "$@" && git status -sb }
