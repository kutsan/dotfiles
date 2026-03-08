# Zsh Line Editor
typeset -g zle_highlight=(region:bg=black) # Highlight the background of the text when selecting.
typeset -g WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # List of characters considered part of a word.
setopt COMBINING_CHARS # Handle combining characters correctly (macOS NFD Unicode).
setopt NO_BEEP # Don't beep on errors.
setopt VI # Use vi emulation mode.

# Changing Directories
typeset -g DIRSTACKSIZE=9 # The maximum size of the directory stack for `pushd` and `popd`.
setopt AUTO_CD # If can't execute the directory, perform the cd command to that.
setopt AUTO_PUSHD # Make cd push the old directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS # Don't push multiple copies of the same directory onto the stack.
setopt PUSHD_MINUS # Exchanges the meanings of `+` and `-` for pushd.
setopt PUSHD_SILENT # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME # Have pushd with no arguments act like `pushd $HOME`.

# Completion
setopt COMPLETE_IN_WORD # Attempt to start completion from both ends of a word.

# Expansion and Globbing
setopt EXTENDED_GLOB # Treat the `#`, `~` and `^` characters as part of patterns for globbing.
setopt GLOB_DOTS # Don't require a leading '.' in a filename to be matched explicitly.
setopt MAGIC_EQUAL_SUBST # Unquoted arguments of the form `key=value` have filename expansion performed.
setopt MARK_DIRS # Append a trailing `/` to all directory names resulting from globbing.
setopt NO_NOMATCH # If a pattern has no matches, don't print an error, leave it unchanged.

# Disable History (History is managed by `atuin`.)
typeset -g SAVEHIST=0 # Disable saving history.
unset HISTFILE # Don't use a history file.

# Input/Output
typeset -g KEYTIMEOUT=20 # The time the shell waits, for another key to be pressed in milliseconds.
setopt NO_CLOBBER # Don't allow `>` redirection to override existing files. Use `>!` instead.
setopt NO_FLOW_CONTROL # Disable flow control characters `^S` and `^Q`.
setopt INTERACTIVE_COMMENTS # Allow comments even in interactive shells.
setopt RM_STAR_WAIT # Before executing `rm *` first wait 10 seconds and ignore anything typed.

# Job Control
setopt LONG_LIST_JOBS # Display PID when suspending processes as well.

# Prompting
setopt PROMPT_SUBST # Expansions are performed in prompts.
