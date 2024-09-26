#!/bin/bash

EssentialPackages=("kitty" "rofi-wayland" "neovim" "ly" "mako" "zsh" w"aybar" "papirus-icon-theme" "zoxide" "hyprland" "swaybg" "slurp" "grim" "sway")
OptionalPackages=("pcmanfm" "ranger" "btop" "qt5ct" "zathura" "nwg-look" "fzf" "ripgrep")
Fonts=("ttf-dejavu-nerd" "ttf-hack-nerd" "ttf-jetbrains-mono-nerd" "ttf-martian-mono-nerd")

# needed skips installed and up-to-date
# noconfirm removes confirmation
PackageManager="pacman --needed --noconfirm -S"

function MakeDir {
	DirName="$1"
	if [[ ! -d "$DirName" ]]; then
		echo "Adding $DirName"
		mkdir -p "$DirName"
	fi
}

function InstallApps {
	for package in "$@"; do
		sudo $PackageManager "$package"
	done
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
InstallApps "${EssentialPackages[@]}"
while true; do
	read -p "Do you want to install optional packages? (y/n)" confirmation
	if [[ $confirmation =~ ^[yY]$ ]]; then
		echo "Installing optional packages"	
		InstallApps "${OptionalPackages[@]}"
		break
	elif [[ $confirmation =~ ^[nN]$ ]]; then
		echo "Not installing optional packages"
		break
	else
		echo "Invalid input. Enter 'y' or 'n'"
	fi
done
InstallApps "${Fonts[@]}"

# PowerLevel10k
echo "- Installing powerlevel10k from git into GitApps directory"
mkdir ~/GitApps
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/GitApps/powerlevel10k

# Stow
InstallApps "stow"
echo "- Using stow for the dotfiles"
cd .dotfiles
stow --adopt .

# Change the shell
if [[ $SHELL =~ /zsh$ ]]; then
	echo "- Shell is alredy zsh"
else
	echo "- Changing user shell to zsh"
	chsh --shell "/usr/bin/zsh" $USER
fi

# Enabling login manager
# Get the name of the login manager
displayManager=$(systemctl status display-manager.service | grep "loaded" | awk '{print $3}' | cut -d '.' -f 1 | rev | cut -d '/' -f 1 | rev)
# If ly is not enabled
if [[ $displayManager != "ly" ]]; then
	while true; do
		# Ask to enable
		read -p "Disable the current login manager ($displayManager) for ly? (y/n)" confirmDisplay
		if [[ $confirmDisplay =~ ^[yY]$ ]]; then
			# Disable the current manager
			sudo systemctl disable $displayManager
			# Enable ly
			sudo systemctl enable ly
			break
		elif [[ $confirmDisplay =~ ^[nN]$ ]]; then
			# Else exit
			break
		else
			echo "Invalid input. Enter 'y' or 'n'"
		fi
	done
fi

echo "- Script is finished"
echo "- Logout out and log back in"
