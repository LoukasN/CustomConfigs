#!/bin/bash

EssentialPackages="kitty rofi-wayland neovim ly mako zsh waybar Papirus-icon-theme zoxide hyprland swaybg slurp grim"
OptionalPackages="pcmanfm ranger btop qt5ct zathura nwg-look fzf ripgrep"

PackageManager="pacman --noconfirm -S"

function MakeDir {
	DirName="$1"
	if [[ -d "$DirName" ]]; then
		echo "Adding $DirName"
		mkdir -p "$DirName"
	fi
}

function InstallApps {
	sudo "$PackageManager" "$1"
}

echo "-----------------------"
echo "Starting install script"
echo "-----------------------"
echo

# Directories
echo "- Creating .config directories"
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
MakeDir "$HOME/.config/tmux/plugins"
MakeDir "$HOME/.config/waybar"
MakeDir "$HOME/.config/zsh/plugins"
MakeDir "$HOME/.local/share"
MakeDir "$HOME/Pictures/wallpapers"

# Packages
echo "Installing applications"
InstallApps "$EssentialPackages"
while true; do
	read -p -r "Do you want to install optional packages? (y/n)" confirmation
	if [[ $confirmation == [yY] ]]; then
		echo "Installing optional packages"	
		InstallApps "$OptionalPackages"
		break
	elif [[ $confirmation == [nN] ]]; then
		echo "Not installing optional packages"
		break
	fi
done

# PowerLevel10k
echo "- Installing powerlevel10k from git into GitApps directory"
mkdir ~/GitApps
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/GitApps/powerlevel10k

InstallApps "stow"
echo "- Using stow for the dotfiles"
cd ~/.dotfiles
stow --adopt .

# Change the shell
if [[ $SHELL =~ /zsh$ ]]; then
	exit
else
	echo "- Changing user shell to zsh"
	chsh --shell "/usr/bin/zsh" $USER
fi
