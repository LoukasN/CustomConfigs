#! bin/bash

echo "Downloading Dependancies...."
bash Dependancies.sh

echo "Copying from $PWD to /home/$USER/.config/"
bash Setup.sh
