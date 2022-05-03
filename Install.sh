  GNU nano 4.8                                                                                       Install.sh                                                                                        Modified
##!/bin/bash
echo "You are about to download and install the required items for HP ILO4 fan control."
echo "Do you accept? [yes] or [no] :"
read input
if [ $input = yes ] ; then
# agreement confirmed
# refresh OR create agreement file status
        echo "Installing required apt packages; sshpass, lm-sensors, and wget"
        apt install sshpass wget lm-sensors jq -y
        echo "Installed required apt packages"
        cd /
        echo "Downloading ILO_250 for ROM upgrade to the / directory."
        wget https://github.com/That-Guy-Jack/HP-ILO-Fan-Control/tree/main/Files/ilo_250
        echo "Download finished!"
        echo "Making autofan.service"
        cd /etc/systemd/system/
        wget https://raw.githubusercontent.com/That-Guy-Jack/HP-ILO-Fan-Control/main/Files/autofan.service
        echo "Finished making autofan.service"
        echo "Which server are you running? DL360p G8 (1) or DL380p G8 (2) [1] or [2] :"
                read server
                if [ $server = 1 ] ; then
                        echo "Preping autofan.sh for DL360p G8"
                        cd /
                        echo "Downloading latest autofan.sh"
                        wget https://raw.githubusercontent.com/That-Guy-Jack/HP-ILO-Fan-Control/main/Files/autofan.sh
                        echo "Downloaded autofan.sh, please change the placeholders with correct info"
                        echo "Please cisit the GitHub page to follow the instructions!"
                        echo "https://github.com/That-Guy-Jack/HP-ILO-Fan-Control"
                        exit 1
                elif [ $server = 2 ] ; then
                        echo "Preping autofan.sh for DL380p G8"
                        cd /
                        echo "Downloading latest autofan.sh"
                        wget https://raw.githubusercontent.com/That-Guy-Jack/HP-ILO-Fan-Control/main/Files/autofan-dl380p-g8.sh
                        echo "Renaming file"
                        mv autofan-dl380p-g8.sh autofan.sh
                        echo "Downloaded autofan.sh, please change the placeholders with correct info"
                        echo "Please cisit the GitHub page to follow the instructions!"
                        echo "https://github.com/That-Guy-Jack/HP-ILO-Fan-Control"
                        exit 1
                fi
else
   echo " :( exitting"
   exit 1
fi
