#!/bin/bash
dir="/home/$USER/Pictures/wallpapers/" # Wallpaper directory
ConfigFile="/home/$USER/.config/sway/config" # The config for the script to write to
mode="fill"	# The mode that the image will be scaled
primaryMonitor=$(swaymsg -t get_outputs --pretty | grep Output | awk -F ' ' '{print $2}' | head -n '1') # Name of the main monitor
secondaryMonitor=$(swaymsg -t get_outputs --pretty | grep Output | awk -F ' ' '{print $2}' | tail -n '1') # Name of the second monitor
input=$(cat $ConfigFile | grep "fill") # Get previous wallpapers from file

SelectPic(){
	wallpaper=$(ls $dir | rofi -dmenu -p "Select wallpaper")
	echo "$wallpaper"
	if [[ $wallpaper == "q" || $wallpaper == "" ]]; then
		exit 
	else
		SetWallpaper
	fi
}

selectmonitor(){
	monitor=$(echo -e "Primary\nSecondary" | rofi -dmenu -p "Select monitor")
	if [ $monitor == "Primary" ]; then
		PreviousSecondary=$(echo $input | awk -F ' ' '{print $4}' | cut -d '/' -f 6 | head -n '1') # Get previous secondary wallpapers name
		PrimaryWallpaper=$wallpaper
		SecondaryWallpaper=$PreviousSecondary
	elif [ $monitor == "Secondary" ]; then
		PreviousPrimary=$(echo $input | awk -F ' ' '{print $4}' | cut -d '/' -f 6 | head -n '1') # Get previous primary wallpapers name
		PrimaryWallpaper=$PreviousPrimary
		SecondaryWallpaper=$wallpaper
	fi
}

SetWallpaper(){
	selectmonitor
	sed -i '/wallpapers/d' $ConfigFile
	sed -i ' /This 3 lines are written by the script/d' $ConfigFile
	echo -e "# This 3 lines are written by the script located in ~/.config/rofi/rofi-wallpaper-changer-sway" >> $ConfigFile
	echo "output $primaryMonitor bg $dir$PrimaryWallpaper $mode" >> $ConfigFile
	echo "output $secondaryMonitor bg $dir$SecondaryWallpaper $mode" >> $ConfigFile
	swaymsg reload
}


SelectPic
