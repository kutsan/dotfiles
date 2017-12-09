#!/usr/bin/env zsh

# Preffered config directory.
VSCODE_CONFIG_HOME="$HOME/.config/vscode"

if [[ $(uname) == 'Darwin' ]] {
	VSCODE_HOME="$HOME/Library/Application Support/Code/User"
} else {
	VSCODE_HOME="$HOME/.config/Code/User"
}

files_list=(
	settings.json
	keybindings.json
	snippets/javascript.json
	snippets/javascriptreact.json
)

# Backup files.
foreach file ("${files_list[@]}") {
	# Create subfolder if necessary.
	[[ $file == */* ]] && \
		mkdir -p "$VSCODE_CONFIG_HOME/${file%/*}"

	cp \
		"$VSCODE_HOME/$file" \
		"$VSCODE_CONFIG_HOME/$file"
}

# Print installed extensions and save.
hash code && code --list-extensions > ~/.config/vscode/extensions.txt
