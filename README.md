# HP-ILO-Fan-Control
Uses a Custom ROM for The Hp ILO adapter

Allows a Simple Fan Curve to be set using the Custom ROM by u/phoenixdev on reddit (linked below)
In this Repo all files that you need are included : )
The folder contians the unpacked ilo with the replacement rom pre copied. 

all you need to run is the commands below.

## STEPS:

1. Switch Ilo into Maintainance mode. On the Dl360p Gen8 This is located near the backplane conectors on the motherboard. (images in the images file) then reboot.

2. Download and copy to you server the ilo_250 Folder

3. Then run These commands: (on non root users you may need to add sudo to these command)
>

    /etc/init.d/hp-ams stop

    /etc/init.d/hp-health stop

    /etc/init.d/hp-snmp-agents stop

    rmmod hpilo

    modprobe -r hpilo 
    cd ilo_250

    ./flash_ilo4 --direct  (also When Flashing the Fans may spin up to near 100% so be prepared)
   
4. Once the flash has completed shudown your system and unplug it. Make sure to Switch the ilo back out of maintainance mode.

5. Create a file called autofan.service in /etc/systemd/system/ and copy this code: 

 >
 
    [Unit]
    
    Description=Fan Speed Controler using autofan.sh

    [Service]
    
    Restart=always
    
    RestartSec=10s
    
    ExecStart=/bin/bash /autofan.sh 
    

6. Copy the Autofan.sh to the / directory

7. Run systemctl daemon-reload and systemctl start autofan

8. Create a corontab command to start the systemd service on startup: @reboot systemctl start autofan

9. enjoy silence : ) and if thats to fast or slow edit the autofan.sh to your needs.

### To-do
 [ ] Create a Script to Install and Create fan control scripts
 [ ] Allow easier input of ILO pramaters
 
 ### Links and other stuff
Original Reddit post: https://www.reddit.com/r/homelab/comments/hix44v/silence_of_the_fans_pt_2_hp_ilo_4_273_now_with/ 
