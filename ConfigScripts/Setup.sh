#! /bin/bash

#Moving files to Config folder
echo "Copying folder to /home/$USER/.config"
if [-d "/home/$USER/.config"]; then  
  mkdir /home/$USER/.config/
fi
cp -r ../* /home/$USER/.config/
