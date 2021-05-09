# Check prompt installation.
if (! [[ -d "$ZDOTDIR/plugins/pure" ]]) {
  return 1
}

# Add prompt to fpath.
fpath=($fpath "$ZDOTDIR/plugins/pure")

# Prompt settings.
typeset -g PURE_PROMPT_VICMD_SYMBOL="▢"
zstyle :prompt:pure:git:stash show yes

# Initialize the prompt system.
promptinit

# Prompt theme.
prompt pure

# Prompt styles.
zstyle :prompt:pure:prompt:error color 1
zstyle :prompt:pure:prompt:success color 15
