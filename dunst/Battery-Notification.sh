#!/bin/bash

declare -A notified

notified[5]=false
notified[15]=false
notified[50]=false

while true; do

	# Get the battery level
	battery_level=$(acpi | awk -F ' ' '{print $4}' | cut --characters=-2)

	# Send notification
	if [ -z "$battery_level" ]; then
		notify-send -e "Battery level couldn't be retrieved \nacpi needed"
	elif [ "$battery_level" -lt 5 ] && [ "${notified[5]}" = false ]; then
		notify-send -t 5 "Battery is at 5%"
		notified[5]=true
	elif [ "$battery_level" -lt 15 ] && [ "${notified[15]}" = false ]; then
		notify-send -t 5"Battery is at 15%"
		notified[15]=true
	elif [ "$battery_level" -lt 50 ] && [ "${notified[50]}" = false ]; then
		notify-send -t 5 "Battery is at 50%"
		notified[50]=true
	fi

	# Reset notification
	if [ "$battery_level" -gt 5 ]; then
		notified[5]=true
	elif [ "$battery_level" -gt 10 ]; then
		notified[15]=true
	elif [ "$battery_level" -gt 10 ]; then
		notified[50]=true
	fi

	# Wait for 5 minutes then check again
	sleep 300

done
