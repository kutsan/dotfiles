# Core Shortcuts
alias rm='trash' # Use `trash` program instead of built-in irrecoverable way to delete nodes.
alias mv='mv -iv' # Move nodes with interactive mode and extra verbosity.
alias ln='ln -iv' # Link nodes with interactive mode and extra verbosity.
alias mkdir='mkdir -p' # Make missing parent directories when creating folders.
alias grep="grep --color='auto'" # Grep with colors.
alias du='du -d 1 --si' # Display size of files and folders under current directory.
alias df='df -a --si' # Display all disk usage statistics with SI units and FS types.
alias ls='ls -AFG' # List name of nodes.
alias la='ls -lAh' # List nodes with their details.

# Custom Shortcuts
alias v="$EDITOR"
alias g='git'
compdef g='git'
alias pn='pnpm'
alias px='pnpx'

typeset -A git_aliases=(
  a   add
  b   branch
  bl  branch
  c   commit
  d   diff
  ds  diff
  dt  difftool
  dts difftool
  f   fetch
  l   log
  ld  log
  r   reflog
  rd  reflog
  s   status
  sm  submodule
  sw  switch
)

# Loop through each alias, create the alias, and set the compdef
for key in ${(k)git_aliases}; do
  alias g$key="git $key"
  compdef _git "g$key=git-${git_aliases[$key]}"
done
unset git_aliases
unset key
