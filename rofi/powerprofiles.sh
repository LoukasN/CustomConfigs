#!/bin/sh

CurrentProfile=$(powerprofilesctl get)
SelectedProfile=$CurrentProfile
Performance="󰓅 Performance"
Balanced="󰗑 Balanced"
BatterySaving=" Power-Saver"

SelectedProfile=$(echo "$Performance
$Balanced
$BatterySaving" | rofi -dmenu -i -theme "~/.config/rofi/Casual-Dark-PowerProfilesMenu.rasi")

if [ "$SelectedProfile" == "$Performance" ]
then
	powerprofilesctl set performance
	dunstify "Profile changed to $SelectedProfile"
elif [ "$SelectedProfile" == "$Balanced" ]
then
	powerprofilesctl set balanced
	dunstify "Profile changed to $SelectedProfile"
elif [ "$SelectedProfile" == "$BatterySaving" ]
then
	powerprofilesctl set power-saver
	echo "Hello"
	dunstify "Profile changed to $SelectedProfile"
fi

exit
