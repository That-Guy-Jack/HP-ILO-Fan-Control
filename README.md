# HP-ILO-Fan-Control
Allows a Simple Fan Curve to be set using the custom ROM made by u/phoenixdev on Reddit. (linked below)
This repo contains all of the required files! :)

All you need to run is the commands below.

### Currently, the scripts are only for Linux!
 ~~ESXi Support is in the works!~~ Thanks to @thomaswilbur For making the ESXI verstion of the script! - see EXSI readme

## STEPS:

1. Switch ILO into maintainance mode, then reboot. (On the DL360 G8, this is located near the backplane connectors to the motherboard.)

2. Download the `install.sh` script and run it. This will download all required files and move them, installs the `autofan.service`, and downloads the correct `autofan.sh` based on your input ready to be edited. If you are an advanced user, you can install everything sperately.
(Download using `wget https://raw.githubusercontent.com/That-Guy-Jack/HP-ILO-Fan-Control/main/Install.sh`)

3. Run the `prep.sh` in the `ilo_250` folder. If this errors it may be beacuse the ILO isnt it maintainance mode. (You may need to run this script as root.)
>

    ./flash_ilo4 --direct  
    
(When flashing the fans spin up to 100%, so be prepared)
   

4. Once the flash has completed, shut down your system and unplug it. Make sure to switch ILO back out of maintainance mode.  

5. Configure `autofan.sh` in the / directory. Replace your password, your username, and your ILO ip with the correct info. Once done, save and exit.

6. Run `systemctl daemon-reload` and `systemctl start autofan` to activate the service.

7. Create a crontab command to start the systemd service on startup: `@reboot systemctl start autofan`.

8. Enjoy silence! :) And if thats toO fast or slow, edit the autofan.sh to your needs.


# Tested Servers:
## 1U Servers:
DL360p Gen8
## 2U Servers:
DL380p Gen8
DL380p Gen9
DL80 Gen9 - Tested by @rootless4real

# Notes
- I recommend especially for the DL360 to add a small 40mm fan to the RAID controller to keep it cool.
- If you have the fan script working on a different server than what's listed in the tested server section, create a issue and I'll add it.
- 
### To-do
- [x] Create a Script to Install and Create fan control scripts
- [x] Allow easier input of ILO pramaters
- [ ] Make ESXI friendly version - Script now Existis and works just needs automation
- [ ] Add info about the security switch
- [ ] Allow users to input ILO paramaters when using `install.sh` 
- [ ] Make the install.sh script have fun colours :D
 
 ### Links and other stuff
Original Reddit post: https://www.reddit.com/r/homelab/comments/hix44v/silence_of_the_fans_pt_2_hp_ilo_4_273_now_with/ 
