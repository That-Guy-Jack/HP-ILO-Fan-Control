# HP-iLO-Fan-Control

**Scripts are available for Linux and ESXi!**

Allows a Simple Fan Curve to be set using the custom ROM made by u/phoenixdev on Reddit. (linked below)

This repo contains all the required files! :)

All you need to run is the commands below.

Currently using ILO4 Version 2.60 - Working on updating to 2.77 <https://github.com/kendallgoto/ilo4_unlock>

## BEFORE PROCEEDING

**READ `SECURITY-SWITCH.MD`, IT INCLUDES A LOT OF INFORMATION.**

## Installation

1. Switch iLO into maintenance mode, then reboot. (On the DL360 G8, this is located near the backplane connectors to the motherboard.)

2. Download the `install.sh` script and run it. This will download all required files and move them, installs the `autofan.service`, and downloads the correct `autofan.sh` based on your input ready to be edited. If you are an advanced user, you can install everything separately.
(Download using `wget https://raw.githubusercontent.com/That-Guy-Jack/HP-ILO-Fan-Control/main/Install.sh`)

3. Run the `prep.sh` in the `ilo_250` folder. If this errors, it may be because the iLO isn't it maintenance mode. (You may need to run this script as root. When flashing the fans spin up to 100%, so be prepared)

4. > ./flash_ilo4 --direct

5. Once the flash has completed, shut down your system and unplug it. Make sure to switch iLO back out of maintenance mode.  

6. Run `systemctl daemon-reload` and `systemctl start autofan` to activate the service.

7. Run `systemctl enable autofan` to start the service on reboot.

8. Enjoy silence! :) And if that’s too fast or too slow, edit `autofan.sh` to your needs.

## Tested Servers

### 1U Servers

DL360p Gen8

### 2U Servers

DL380p Gen8 

DL380p Gen9

DL80 Gen9 - Tested by @rootless4real

SL4540 Gen8 - Tested by @YoSiJo

HPE 2U StoreEasy 1650 - Tested by @nicr4wks

HP 2U ProLiant XL420 Gen9 - Tested by @bogdik

## Notes

- I recommend especially for the DL360 to add a small 40mm fan to the RAID controller to keep it cool.
- If you have the fan script working on a different server than what's listed in the tested server section, create an issue and I'll add it.

### To-do

- [x] Create a Script to Install and Create fan control scripts
- [x] Allow easier input of iLO parameters
- [x] Make ESXI friendly version - Big thanks to @thomaswilbur for making the script and @TannerFilip for making the script easier to use!
- [x] Add info about the security switch
- [x] Allow users to input iLO parameters when using `install.sh` 
- [x] Make the install.sh script have fun colors :D - added thanks to @TannerFilip
- [x] Add features mentioned in That-Guy-Jack/HP-ILO-Fan-Control#15

### Links and other stuff

Original Reddit post: <https://www.reddit.com/r/homelab/comments/hix44v/silence_of_the_fans_pt_2_hp_iLO_4_273_now_with/>
