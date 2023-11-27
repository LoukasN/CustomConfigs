#!/bin/bash

WallpaperDir="/home/$USER/Pictures/wallpapers/" # Wallpaper dir
ConfigLocation="/home/$USER/.config/hypr/hyprland.conf" # The config file to edit
mode="fill" # Scaling mode
PrevWallpaper=$(cat $ConfigLocation | grep "swaybg" | awk -F '/' '{print $4}') # Get previous wallpapers lines from file)

SelectPic(){
	# Shows the wallpaper selection menu in rofi
	Wallpaper=$(ls $WallpaperDir | rofi -dmenu -p "Select wallpaper")
	if [[ $Wallpaper == "q" || $Wallpaper == "" ]]; then
		exit
	else
		SetWallpaper
	fi
}

SetWallpaper(){
	sed -i -e "s/$PrevWallpaper/$Wallpaper/g" $ConfigLocation
}

SelectPic
exit
