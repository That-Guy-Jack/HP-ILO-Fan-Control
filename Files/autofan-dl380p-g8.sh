#!/bin/bash
#
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

T1="$(sensors -Aj coretemp-isa-0000 | jq '.[][] | to_entries[] | select(.key | endswith("input")) | .value' | sort -rn | head -n1)"
T2="$(sensors -Aj coretemp-isa-0001 | jq '.[][] | to_entries[] | select(.key | endswith("input")) | .value' | sort -rn | head -n1)"

echo "==============="
echo "CPU 1 Temp $T1 C"
echo "==============="

if [[ $T1 > 67 ]]; then
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 255'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 4 max 255'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 5 max 255'

elif [[ $T1 > 58 ]]; then
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 39'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 4 max 39'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 5 max 39'

elif [[ $T1 > 54 ]]; then
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 38'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 4 max 38'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 5 max 38'

elif [[ $T1 > 52 ]]; then
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 34'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 4 max 34'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 5 max 34'

elif [[ $T1 > 50 ]]; then
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 32'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 4 max 32'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 5 max 32'

else
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 30'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 4 max 30'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 5 max 30'

fi

echo "==============="
echo "CPU 2 Temp $T2 C"
echo "==============="

if [[ $T2 > 67 ]]; then
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 255'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 255'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 255'

elif [[ $T2 > 58 ]]; then
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 39'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 39'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 39'

elif [[ $T2 > 54 ]]; then
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 38'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 38'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 38'

elif [[ $T2 > 52 ]]; then
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 34'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 34'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 34'

elif [[ $T2 > 50 ]]; then
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 32'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 32'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 32'

else
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 30'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 30'
    sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 30'

fi
