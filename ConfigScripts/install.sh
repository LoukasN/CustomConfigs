#! bin/bash

echo "Downloading Dependancies...."
bash ~/CustomConfigs/ConfigScripts/Dependancies.sh

echo "Copying from $PWD to /home/$USER/.config/"
bash ~/CustomConfigs/ConfigScripts/Setup.sh
