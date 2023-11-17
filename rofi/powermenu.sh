#!/bin/bash
 
lock="Lock"
logout="Logout"
shutdown="Poweroff"
reboot="Reboot"
sleep="Suspend"
 
selected_option=$(echo "$shutdown
$reboot
$logout
$sleep
$lock" | rofi -dmenu -i -p "Powermenu")

if [ "$selected_option" == "$lock" ]
then
  swaylock -f -e -c 000000 --font HackNerdFont --indicator-radius 65 --indicator-thickness 7
elif [ "$selected_option" == "$logout" ]
then
  systemctl terminate-user `whoami`
elif [ "$selected_option" == "$shutdown" ]
then
  systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
  systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
  systemctl suspend
else
  echo "No match"
fi
