#!/usr/bin/env zsh

setopt ERR_EXIT NO_UNSET PIPE_FAIL WARN_CREATE_GLOBAL WARN_NESTED_VAR XTRACE

path+=(~/.cargo/bin)

trash ~/Documents/alacritty 2>/dev/null
hub clone jwilm/alacritty ~/Documents/alacritty
cd ~/Documents/alacritty

rustup override set stable
rustup update stable

cargo build --release
make app
echo y | cp -r target/release/osx/Alacritty.app /Applications/Alacritty.app

git log --oneline $(cat $XDG_CACHE_HOME/alacritty/version)..master >! $XDG_CACHE_HOME/alacritty/news
git rev-parse --short HEAD >! $XDG_CACHE_HOME/alacritty/version

trash ~/Documents/alacritty
