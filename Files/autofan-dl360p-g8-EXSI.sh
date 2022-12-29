#!/bin/bash
# 1U
# crontab -l > mycron
# echo "#" >> mycron
# echo "# At every 2nd minute" >> mycron
# echo "*/1 * * * * /bin/bash /autofan.sh >> /tmp/cron.log" >> mycron
# crontab mycron
# rm mycron
# chmod +x /autofan.sh
#

PASSWORD="YOUR_ILO_PASSWORD"
USERNAME="YOUR_ILO_USER"
ILOIP="YOUR_ILO_IP"

FILE="/usr/bin/sshpass"
if [ -f "$FILE" ]; then
    echo "sshpass already loaded."

else
    esxcli network firewall ruleset set -e true -r httpClient
    pwdlocation=$(pwd)
    cd /tmp
    wget https://github.com/thomaswilbur/HP-ILO-Fan-Control/blob/main/Files/sshpass?raw=true --no-check-certificate
    mv sshpass?raw=true /usr/bin/sshpass
    chmod +x sshpass
    cd pwdlocation
    echo "sshpass loaded."

fi

esxcli network firewall ruleset set -e true -r sshClient

#T1="$(sensors -Aj coretemp-isa-0000 | jq '.[][] | to_entries[] | select(.key | endswith("input")) | .value' | sort -rn | head -n1)"
#T2="$(sensors -Aj coretemp-isa-0001 | jq '.[][] | to_entries[] | select(.key | endswith("input")) | .value' | sort -rn | head -n1)"

sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP show /system1/sensor2 > temp.txt
T1CLEAN=$(grep -Ihr "CurrentReading" temp.txt)
T1=$(echo "${T1CLEAN/    CurrentReading=/}" | xargs)
rm -rf temp.txt

sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP show /system1/sensor3 > temp.txt
T2CLEAN=$(grep -Ihr "CurrentReading" temp.txt)
T2=$(echo "${T2CLEAN/    CurrentReading=/}" | xargs)
rm -rf temp.txt

T1=${T1//$'\n'/}
T2=${T2//$'\n'/}
T1=${T1%$'\n'}
T2=${T2%$'\n'}

echo "CPU 1 Temp $T1 C"

if [[ $T1 > 87 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 4 max 80'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 5 max 80'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 6 max 80'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 7 max 80'

elif [[ $T1 > 77 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 4 max 70'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 5 max 70'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 6 max 70'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 7 max 70'

elif [[ $T1 > 67 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 4 max 39'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 5 max 39'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 6 max 39'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 7 max 39'

elif [[ $T1 > 58 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 4 max 30'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 5 max 30'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 6 max 30'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 7 max 30'

elif [[ $T1 > 54 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 4 max 28'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 5 max 28'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 6 max 28'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 7 max 28'

elif [[ $T1 > 52 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 4 max 24'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 5 max 24'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 6 max 24'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 7 max 24'

elif [[ $T1 > 50 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 4 max 22'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 5 max 22'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 6 max 22'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 7 max 22'

else
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 4 max 20'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 5 max 20'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 6 max 20'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 7 max 20'

fi

echo "CPU 2 Temp $T2 C"

if [[ $T2 > 87 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 0 max 80'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 1 max 80'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 2 max 80'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 3 max 80'

elif [[ $T2 > 77 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 0 max 70'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 1 max 70'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 2 max 70'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 3 max 70'

elif [[ $T1 > 67 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 0 max 39'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 1 max 39'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 2 max 39'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 3 max 39'

elif [[ $T2 > 58 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 0 max 30'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 1 max 30'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 2 max 30'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 3 max 30'

elif [[ $T2 > 54 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 0 max 28'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 1 max 28'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 2 max 28'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 3 max 28'

elif [[ $T2 > 52 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 0 max 24'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 1 max 24'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 2 max 24'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 3 max 24'

elif [[ $T2 > 50 ]]; then
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 0 max 22'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 1 max 22'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 2 max 22'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 3 max 22'

else
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 0 max 20'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 1 max 20'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 2 max 20'
    sshpass -p $PASSWORD ssh -oStrictHostKeyChecking=no -oKexAlgorithms=+diffie-hellman-group14-sha1 $USERNAME@$ILOIP 'fan p 3 max 20'

fi
