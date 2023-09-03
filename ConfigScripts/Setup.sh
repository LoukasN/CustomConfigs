#! /bin/bash

#Moving files to Config folder
echo "Copying folder to /home/$USER/.config"
if [-d "/home/$USER/.config"]; then
  echo "Creating /home/$USER/.conf"
  mkdir /home/$USER/.config/
fi
cp -r ../* /home/$USER/.config/
