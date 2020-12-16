# Core Shortcuts
alias rm='trash' # Use `trash` program instead of built-in irrecoverable way to delete nodes.
alias mv='mv --interactive --verbose' # Move nodes with interactive mode and extra verbosity.
alias cp='cp --interactive --verbose' # Copy nodes with interactive mode and extra verbosity.
alias ln='ln --interactive --verbose' # Link nodes with interactive mode and extra verbosity.
alias mkdir='mkdir --parents' # Make missing parent directories when creating folders.
alias grep="grep --color='auto'" # Grep with colors.
alias du='du --max-depth=1 --si' # Display size of files and folders under current directory.
alias df='df --all --si --print-type' # Display all disk usage statistics with SI units and FS types.
alias ls='ls --almost-all --classify --color=always --group-directories-first --literal' # List name of nodes.
alias la='ls -l --almost-all --si' # List nodes with their details.

# Custom Shortcuts
alias v='nvim'
alias g='git'
alias tmux='tmux -f "$HOME/.tmux/tmux.conf"'
alias bwlogin='bw login --code "$(auth bitwarden)" "$(< ~/.config/neomutt/accounts/com.gmail/email.txt)" "$(gpg --no-tty --for-your-eyes-only --quiet --decrypt ~/.bitwarden/secret.gpg)"'
alias bwunlock='export BW_SESSION="$(bw unlock --raw $(gpg --no-tty --for-your-eyes-only --quiet --decrypt ~/.bitwarden/secret.gpg))"'
alias pacman='sudo pacman'
alias rsync='rsync --protect-args --compress --verbose --progress --human-readable'
alias l="ledger balance '^assets' '^liabilities' --empty"
alias le='$EDITOR ~/Projects/sync/finance/journal-$(date +%Y).ledger'
alias lnet="ledger register '^expenses' '^income' --period 'this month' --subtotal --invert"
alias s='$EDITOR ~/Projects/sync/notes/tasks.yml'
alias gen-packagejson='cp "$HOME/.config/npm/package.json" "package.json"'
alias gen-editorconfig='cp "$HOME/.editorconfig" ".editorconfig"'

# Global Aliases
alias -g L='| less'
alias -g G='| grep'

# git
foreach aliaskey (a b bl c co d ds dt dts f l r s sm w) {
	alias g$aliaskey="git $aliaskey"
}
unset aliaskey
