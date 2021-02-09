#!/bin/bash

    /etc/init.d/hp-ams stop

    /etc/init.d/hp-health stop

    /etc/init.d/hp-snmp-agents stop

    rmmod hpilo

    modprobe -r hpilo 
    cd ilo_250
