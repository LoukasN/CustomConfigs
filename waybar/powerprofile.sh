#!/bin/bash

CurrentProfile=$(powerprofilesctl get)

if [[ $CurrentProfile == performance ]]; then
	echo "󰓅 "
elif [[ $CurrentProfile == balanced ]]; then
	echo "󰗑 "
elif [[ $CurrentProfile == power-saver ]]; then
	echo " "
fi
