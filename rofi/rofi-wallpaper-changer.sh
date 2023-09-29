#!/bin/bash

#AUTHOR: ABDELRHMAN NILE (PIRATE)
#github: https://github.com/AbdelrhmanNile
#Modified quite a bit by LoukasN

# this script WILL NOT WORK if you don't have feh and rofi, please install them first
#
dir="/home/$USER/Pictures/wallpapers/" # wallpapers folder, change it to yours, make sure that it ends with a /
cd $dir
wallpaper="none selected" 
set="exec_always --no-startup-id sleep 1 && feh --bg-fill" #what command is writen in the configm
view="feh"
startup_config_file="/home/$USER/.config/i3/config" #change this to whatever config file that sets your wallpaper on startup, this file will get modified if you choose tp set a wallpaper permanantly 
connected_monitors=$(xrandr --listactivemonitors | grep "+" | wc -l) #checks number of monitors

########################-GET LAST USED WALLPAPERS-###################################
input=$(cat ~/.config/i3/config | grep "\--bg-fill")
PreviousPrimary=$(echo $input | awk -F '/wallpapers/' '{print $2}' | cut -d ' ' -f 1)
PreviousSecondary=$(echo $input | awk -F '/wallpapers/' '{print $3}')
#####################################################################################

########################-FUNCTION FOR SELECTING MONITOR-#########################
selectmonitor(){
	monitor=$(echo -e "Primary\nSecondary" | rofi -dmenu -p "Select monitor")
	if [[ $monitor == "Primary" ]]; then
		Primary=$wallpaper
		Secondary=$PreviousSecondary
	elif [[ $monitor == "Secondary" ]]; then
		Primary=$PreviousPrimary
		Secondary=$wallpaper
	fi
}
#################################################################################

########################-FUNCTION FOR SELECTING A WALLPAPER-###################
selectpic(){
    wallpaper=$(ls $dir | rofi -dmenu -p "Select wallpaper")

    if [[ $wallpaper == "q" || $wallpaper == "" ]]; then
        killall feh && exit 
    else
	set_permanant
    fi
}
###############################################################################

########################-FUNCTION TO SET THE WALLPAPER permanantly, IT WILL MODIFY YOUR START UP CONFIG FILE-#################################################################
set_permanant(){
  #set_wall
  if [[ $connected_monitors == "2" ]]; then 
	selectmonitor
  else
	Primary=$wallpaper
	Secondary=$PreviousSecondary
  fi 
  sed -i '/feh/d' $startup_config_file
  echo -e "# This 3 lines are written by the script (uses feh) located in ~/.config/rofi/rofi-wallpaper-changer\n# Changing wallpaper using feh" >> $startup_config_file
  echo "$set $dir$Primary $dir$Secondary" >> $startup_config_file
  i3-msg restart
}
##############################################################################################################################################################################

###################-MAIN-####################
selectpic
