# Register functions as widgets.
foreach widget (
  'add-surround surround'
  'delete-surround surround'
  'change-surround surround'
  select-bracketed
  select-quoted
  user-fuzzy-history
  user-fuzzy-select
) {
  eval zle -N $widget
}
unset widget

# Select command from history into the command line.
function user-fuzzy-history() {
  if ! (( $+commands[fzf] )) {
    return 1
  }

  setopt LOCAL_OPTIONS NO_GLOB_SUBST NO_POSIX_BUILTINS PIPE_FAIL 2>/dev/null

  local selected=($(
    fc -l 1 \
    | fzf \
      --tac \
      --nth='2..,..' \
      --tiebreak='index' \
      --query="${LBUFFER}" \
      --exact
  ))

  local stat=$?

  if [[ "$selected" != '' ]] {
    local num=$selected[1]

    if [[ "$num" != '' ]] {
      zle vi-fetch-history -n $num
    }
  }

  zle reset-prompt
  return $stat
}

# Paste the selected file or directory into the command-line.
function user-fuzzy-select() {
  if ! (( $+commands[fzf] )) {
    return 1
  }

  local directory=${${(ps: :)LBUFFER}[-1]}
  (! [[ -d "$directory" ]]) && unset directory

  local selected=$(
    find -L ${directory:-'.'} \
      \( \
        -fstype 'dev' \
        -or -fstype 'proc' \
        -or \( -name 'node_modules' -and -type 'd' \) \
      \) -prune \
      -or \( -type 'd' -printf '%p/\n' , -type 'f' -print \) 2>/dev/null \
    | sed 1d \
    | ([[ -v directory ]] && cat || cut --bytes=3-) \
    | fzf \
      --preview-window='right:60%' \
      --preview=' \
        if [ -d {} ]; then; \
          ls -l --si --almost-all --classify --color=always --group-directories-first --literal {} 2>/dev/null; \
        else \
          cat {} 2>/dev/null; \
        fi \
      ' \
  )

  if [[ "$selected" != '' ]] {
    LBUFFER="${LBUFFER//${directory:-}/}${selected}"
  }

  zle reset-prompt
}
