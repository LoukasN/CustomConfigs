#!/bin/bash
# i3blocks script for showing the currently focused window in Sway

# Get the currently focused window using swaymsg
windowname=$(swaymsg -t get_tree | jq -r 'recurse(.nodes[]) | select(.focused==true) | .name')

# Print the window name
if [[ $windowname != [0-9] ]]; then
	echo $windowname
fi
