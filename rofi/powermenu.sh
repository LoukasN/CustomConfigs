#!/bin/bash
 
shutdown=" Poweroff"
restart=" Restart"
logout="󰍃 Logout"
sleep="󰤄 Suspend"
lock=" Lock"
 
selected_option=$(echo "$shutdown
$restart
$logout
$sleep
$lock" | rofi -dmenu -i -p "Powermenu" -theme "~/.config/rofi/Casual-Dark-PowerMenu.rasi")

if [ "$selected_option" == "$lock" ]
then
  swaylock -f -e -c 000000 --font HackNerdFont --indicator-radius 65 --indicator-thickness 7
  exit
elif [ "$selected_option" == "$logout" ]
then
  hyprctl dispatch exit 1
  exit
elif [ "$selected_option" == "$shutdown" ]
then
  systemctl poweroff
  exit
elif [ "$selected_option" == "$restart" ]
then
  systemctl restart
  exit
elif [ "$selected_option" == "$sleep" ]
then
  systemctl suspend
  exit
fi
