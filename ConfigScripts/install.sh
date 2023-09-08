#! bin/bash

echo "Downloading Dependancies...."
bash /CustomConfigs/ConfigScripts/Dependancies.sh

echo "Copying from $PWD to /home/$USER/.config/"
bash /CUstomConfigs/ConfigScripts/Setup.sh
