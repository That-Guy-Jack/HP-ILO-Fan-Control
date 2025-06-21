#!/bin/bash

if [ $(id -u) -ne 0 ]; then
    echo -e "\e[31mThis must be run as root!\e[0m"
    exit 126

fi

echo "You are about to download and install the required items for HP ILO4 fan control."
read -rep "Do you accept? (y/N): " ACCEPTED

if [[ ${ACCEPTED,,} =~ ^[y] ]]; then
    mkdir -p ~/autofan
    cd ~/autofan

    echo "Installing required packages..."
    apt install sshpass wget lm-sensors jq -y
    echo -e "\e[92mDownloading ILO_250 for ROM upgrade\e[0m"
    wget -q https://github.com/That-Guy-Jack/HP-ILO-Fan-Control/tree/main/Files/ilo_250

    echo -e "\e[92m Creating autofan service\e[0m"
    wget -q https://raw.githubusercontent.com/That-Guy-Jack/HP-ILO-Fan-Control/main/Files/autofan.service
    mv autofan.service /etc/systemd/system/
    echo -e "\e[92m autofan service created\e[0m"

    read -rep $'Which server are you running? (Enter 1- 5)
    1. DL360p G8 (No ESXi)
    2. DL380p G8 (no ESXi)
    3. DL360p G8 (ESXi-based)
    4. DL380p G8 (ESXi-based)
    5. ML350 G9 (No ESXi)\n' HOSTCHOICE

    case $HOSTCHOICE in
    1)
        AUTOFANFILE="autofan.sh"
        HOSTTYPE="DL360p G8 (No ESXi)"
        ;;

    2)
        AUTOFANFILE="autofan-dl380p-g8.sh"
        HOSTTYPE="DL380p G8 (No ESXi)"
        ;;

    3)
        AUTOFANFILE="autofan-dl360p-g8-EXSI.sh"
        HOSTTYPE="DL360p G8 (ESXi-based)"
        ;;

    4)
        AUTOFANFILE="autofan-dl380p-g8-EXSI.sh"
        HOSTTYPE="DL370p G8 (ESXi-based)"
        ;;

    5)
        AUTOFANFILE="autofan-ml350-g9.sh"
        HOSTTYPE="ML350 G9 (No ESXi)"
        ;;

    *)
        echo -e "\e[31mInvalid choice. Exiting.\e[0m"
        exit 1
        ;;

    esac

    echo "Preping autofan.sh for $HOSTTYPE"
    echo "Downloading latest autofan.sh"
     wget -q https://raw.githubusercontent.com/Illusionist2732/HP-ILO-Fan-Control-ML350/main/Files/$AUTOFANFILE -O autofan.sh
    #wget -q https://raw.githubusercontent.com/That-Guy-Jack/HP-ILO-Fan-Control/main/Files/$AUTOFANFILE -O autofan.sh

while true; do
        read -rep 'Enter iLO Username: ' ILOUSERNAME
        read -rep 'Enter iLO Password: ' ILOPASSWORD
        read -rep 'Enter iLO IP/hostname: ' ILOHOST
           
        echo
        echo "Please confirm the following details:"
        echo "  Username: $ILOUSERNAME"
        echo "  Password: $ILOPASSWORD"
        echo "  Host:     $ILOHOST"
        echo
            read -rep "Are These Correct? (y/N): " ACCEPTED
                if [[ ${ACCEPTED,,} =~ ^[y] ]]; then
                    sed -ri "s/your username/$ILOUSERNAME/" autofan.sh
                    sed -ri "s/your password/$ILOPASSWORD/" autofan.sh
                    sed -ri "s/your ilo ip/$ILOHOST/" autofan.sh
                        mv autofan.sh /
                    echo -e "\e[92mDone! Please visit the GitHub page to follow the instructions!\e[0m"
                    echo -e "\e[1\https://github.com/That-Guy-Jack/HP-ILO-Fan-Control\e[0m"
                    echo -e "\e[1\You may need to edit /bin/bash /autofan.sh To change the credentials if they didn't save properly.\e[0m"
                    break
                else
            echo -e "Try entering the Credentials again."
        fi
done
echo -e "\e[31m:( exiting\e[0m"
exit 0
fi
