# HP-ILO-Fan-Control
Uses a Custom ROM for The Hp ILO adapter

Allows a Simple Fan Curve to be set using the Custom ROM by u/phoenixdev on reddit (linked below)
In this Repo all files that you need are included : )
The folder contians the unpacked ilo with the replacement rom pre copied. 

all you need to run is the commands below.

## STEPS:

1. Switch Ilo into Maintainance mode. On the Dl360p Gen8 This is located near the backplane conectors on the motherboard. (images in the images file) then reboot.

2. Download the install.sh script and Run it this will download all required files and pre moves installs the autofan.service and downloads the correct autofan.sh based on the input ready to be edited. if You are more advanced  you can install everything sperately.
(downlaod using wget https://github.com/That-Guy-Jack/HP-ILO-Fan-Control/blob/main/Install.sh)

3. Then run The prep.sh in the ilo_250 folder ( cd /ilo_250 ) if this errors it may be beacuse the ilo isnt it maintainace (on non root users you may need to add sudo to this command)
>

    ./flash_ilo4 --direct  (also When Flashing the Fans may spin up to near 100% so be prepared)
   

4. Once the flash has completed shudown your system and unplug it. Make sure to Switch the ilo back out of maintainance mode.  

5. Configure The autofan.sh in the / directory. Replace Your Password, Your username and Your ilo ip with the correct info. Once done save and exit.

6. Run systemctl daemon-reload and systemctl start autofan to activate the scripts

7. Create a corontab command to start the systemd service on startup: @reboot systemctl start autofan

8. enjoy silence : ) and if thats to fast or slow edit the autofan.sh to your needs.

### To-do
- [x] Create a Script to Install and Create fan control scripts
- [x] Allow easier input of ILO pramaters
- [ ] Allow users to input ilo paramaters when using the install.sh 
- [ ] Make the install.sh script have fun colours : D
 
 ### Links and other stuff
Original Reddit post: https://www.reddit.com/r/homelab/comments/hix44v/silence_of_the_fans_pt_2_hp_ilo_4_273_now_with/ 
