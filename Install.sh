#!/bin/bash
echo "You are about to Download/Install the required items for the HP ILO Fan control, "
echo "Do you accept that your are about to install? [yes] or [no] :"
read input
if [ $input = yes ] ; then
# agreement confirmed
# refresh OR create agreement file status
        echo "Installing required apt packages sshpass and wget"
        apt install sshpass wget -y
        echo "Installed required apt packages"
        cd /
        echo "Downloading ILO_250 for ROM Upgrade"
        echo "Downloading to / directory"
        wget https://github.com/That-Guy-Jack/HP-ILO-Fan-Control/tree/main/ilo_250
        echo "Finished Download"
        echo "Making autofan.service"
        cd /etc/systemd/system/
        wget https://raw.githubusercontent.com/That-Guy-Jack/HP-ILO-Fan-Control/main/autofan.service
        echo "Finished making autofan.service"
        echo "Preping latest autofan.sh"
        cd /
        echo "Downloading Latest autofan.sh"
        wget https://raw.githubusercontent.com/That-Guy-Jack/HP-ILO-Fan-Control/main/autofan.sh
        echo "Downloaded autofan.sh Change Placeholders with correct info"
        echo "Please Visit the Github Page to Follow Instructions"
        echo "https://github.com/That-Guy-Jack/HP-ILO-Fan-Control"
        exit 1
else
   echo " :( exitting"
   exit 1
   fi

