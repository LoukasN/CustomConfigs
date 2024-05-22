#!/bin/bash

function Remove {
	if [[ -d "$1" ]]; then
		echo "Removing $1"
		rm -r "$1"
	fi
}

echo "-----------------------"
echo "Starting install script"
echo "-----------------------"
echo
echo "- Removing old .config folders if they exist"
Remove "$HOME/.config/alacritty"
Remove "$HOME/.config/dunst"
Remove "$HOME/.config/hypr"
Remove "$HOME/.config/i3"
Remove "$HOME/.config/i3status"
Remove "$HOME/.config/kitty"
Remove "$HOME/.config/nvim"
Remove "$HOME/.config/picom"
Remove "$HOME/.config/ranger"
Remove "$HOME/.config/rofi"
Remove "$HOME/.config/sway"
Remove "$HOME/.config/tmux"
Remove "$HOME/.config/waybar"
echo "- Moving new folders to .config"
mv alacritty ~/.config/
mv dunst ~/.config/
mv hypr ~/.config/
mv i3 ~/.config/
mv i3status ~/.config/
mv kitty ~/.config/
mv nvim ~/.config/
mv picom ~/.config/
mv ranger ~/.config/
mv rofi ~/.config/
mv sway ~/.config/
mv tmux ~/.config/
mv waybar ~/.config/
echo "- Zsh configurations"
mv zsh ~/.config/
mv .aliases ~/
mv .zprofile ~/
echo "- Installing powerlevel10k from git into GitApps dir"
mkdir ~/GitApps
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/GitApps/powerlevel10k
echo "- Setting zsh as default shell"
chsh "$USER" --shell=/usr/bin/zsh
echo "- Adding fonts"
mv HackNerdFont ~/.local/share/fonts/
mv MartianMono ~/.local/share/fonts/
mv DejaVuSansMono ~/.local/share/fonts/
echo "- Adding Pictures"
if [[ -d "$HOME/Pictures" ]]; then
	mv /Pictures/* ~/Pictures
else
	mv Pictures ~/
fi
