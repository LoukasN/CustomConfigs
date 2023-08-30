#! /bin/bash

#Moving files to Config folder
echo "Copying folder to /home/$USER/.config"
mkdir /home/$USER/.config/
cp -r ../* /home/$USER/.config/
