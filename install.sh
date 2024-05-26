#!/bin/bash

function MakeDir {
	if [[ -d "$1" ]]; then
		echo "Adding $1"
		mkdir -p "$1"
	fi
}

echo "-----------------------"
echo "Starting install script"
echo "-----------------------"
echo
echo "- Creating .config folders"
MakeDir "$HOME/.config/alacritty"
MakeDir "$HOME/.config/dunst"
MakeDir "$HOME/.config/hypr"
MakeDir "$HOME/.config/i3"
MakeDir "$HOME/.config/i3status"
MakeDir "$HOME/.config/kitty"
MakeDir "$HOME/.config/nvim"
MakeDir "$HOME/.config/picom"
MakeDir "$HOME/.config/ranger"
MakeDir "$HOME/.config/rofi"
MakeDir "$HOME/.config/sway"
MakeDir "$HOME/.config/tmux"
MakeDir "$HOME/.config/waybar"
MakeDir "$HOME/.config/zsh/plugins"
MakeDir "$HOME/.local/share"
echo "- Installing powerlevel10k from git into GitApps directory"
mkdir ~/GitApps
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/GitApps/powerlevel10k
cd ~/.dotfiles
stow --adopt .
