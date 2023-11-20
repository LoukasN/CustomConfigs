#!/bin/bash
 
shutdown=" Poweroff"
reboot=" Reboot"
logout="󰍃 Logout"
sleep="󰤄 Suspend"
lock=" Lock"
 
selected_option=$(echo "$shutdown
$reboot
$logout
$sleep
$lock" | rofi -dmenu -i -p "Powermenu" -theme "~/.config/rofi/Casual-Dark-PowerMenu.rasi")

if [ "$selected_option" == "$lock" || "$selected_option" == "l"]
then
  swaylock -f -e -c 000000 --font HackNerdFont --indicator-radius 65 --indicator-thickness 7
elif [ "$selected_option" == "$logout" ]
then
  loginctl terminate-user `whoami`
elif [ "$selected_option" == "$shutdown" ]
then
  systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
  systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
  systemctl suspend
fi
