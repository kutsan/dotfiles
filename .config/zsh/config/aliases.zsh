# Core Shortcuts
alias rm='trash' # Use `trash` program instead of built-in irrecoverable way to delete nodes.
alias mv='mv --interactive --verbose' # Move nodes with interactive mode and extra verbosity.
alias cp='cp --interactive --verbose' # Copy nodes with interactive mode and extra verbosity.
alias ln='ln --interactive --verbose' # Link nodes with interactive mode and extra verbosity.
alias mkdir='mkdir -p' # Make missing parent directories when creating folders.
alias grep="grep --color='auto'" # Grep with colors.
alias du='du --max-depth=1 --si' # Display size of files and folders under current directory.
alias df='df --all --si --print-type' # Display all disk usage statistics with SI units and FS types.
alias ls='ls --almost-all --classify --color=always --group-directories-first --literal' # List name of nodes.
alias la='ls -l --almost-all --si' # List nodes with their details.

# Custom Shortcuts
alias v='nvim'
alias g='git'
alias l='ledger'
alias lb="ledger balance '^assets' '^liabilities' --empty"
alias le='cd ~/Projects/finance && git pull --ff-only; nvim +"normal! Gzz" ~/Projects/finance/$(date +%Y)/$(date +%m).ledger'
alias j='cd $JOURNAL_HOME && $EDITOR . && cd -'
alias gen-packagejson='cp "$HOME/.config/npm/package.json" "package.json"'
alias gen-editorconfig='cp "$HOME/.config/editorconfig/.editorconfig" ".editorconfig"'

# git
foreach key (a b bl c co d ds dt dts f l ld r rd s sm w) {
  alias g$key="git $key"
}
unset key
