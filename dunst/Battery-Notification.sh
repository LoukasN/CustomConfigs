#!/bin/bash

declare -A notified

notified[5]=false
notified[15]=false
notified[30]=false

while true; do

	# Get the battery level
	battery_level=$(acpi | awk -F ' ' '{print $4}' | cut --characters=-2 | head --lines=1)

	# Send notification
	if [ -z "$battery_level" ]; then
		notify-send -e "Battery level couldn't be retrieved \nacpi needed"
	elif [[ "$battery_level" -lt 5 ]] && [[ "${notified[5]}" = false ]]; then
		notify-send -t 5 "Battery is at 5%"
		notified[5]=true
	elif [[ "$battery_level" -lt 15 ]] && [[ "${notified[15]}" = false ]]; then
		notify-send -t 5 "Battery is at 15%"
		notified[15]=true
	elif [[ "$battery_level" -lt 30 ]] && [[ "${notified[30]}" = false ]]; then
		notify-send -t 5 "Battery is at 30%"
		notified[30]=true
	fi

	# Reset notification
	if [[ "$battery_level" -gt 5 ]]; then
		notified[5]=false
	elif [[ "$battery_level" -gt 15 ]]; then
		notified[15]=false
	elif [[ "$battery_level" -gt 30 ]]; then
		notified[30]=false
	fi

	# Wait for 5 minutes then check again
	sleep 300

done
