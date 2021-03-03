
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
PASSWORD="your password"
USERNAME="your username"
ILOIP="your ilo ip"
T1="$(sensors -Aj coretemp-isa-0000 | jq '.[][] | to_entries[] | select(.key | endswith("input")) | .value' | sort -rn | head -n1)"
T2="$(sensors -Aj coretemp-isa-0001 | jq '.[][] | to_entries[] | select(.key | endswith("input")) | .value' | sort -rn | head -n1)"

echo "==============="
echo "CPU 1 Temp $T1 C"
echo "==============="

if [ $T1 > 67 ]
   then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 255'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 4 max 255'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 5 max 255'
        #sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 7 max 39'
elif [ $T1 > 58 ]
    then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 30'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 4 max 30'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 5 max 30'
        #sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 7 max 30'
elif [ $T1 > 54 ]
    then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 28'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 4 max 28'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 5 max 28'
        #sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 7 max 28'
elif [ $T1 > 52 ]
    then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 24'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 4 max 24'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 5 max 24'
        #sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 7 max 24'
elif [ $T1 > 50 ]
    then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 22'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 4 max 22'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 5 max 22'
        #sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 7 max 22'
    else
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 20'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 4 max 20'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 5 max 20'
        #sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 7 max 20'
fi

echo "==============="
echo "CPU 2 Temp $T2 C"
echo "==============="

if [ $T2 > 67 ]
   then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 255'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 255'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 255'
        ##sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 39'
elif [ $T2 > 58 ]
    then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 30'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 30'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 30'
        #sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 30'
elif [ $T2 > 54 ]
    then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 28'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 28'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 28'
        #sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 28'
elif [ $T2 > 52 ]
    then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 24'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 24'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 24'
        #sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 24'
elif [ $T2 > 50 ]
    then
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 22'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 22'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 22'
        #sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 22'
    else
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 0 max 20'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 1 max 20'
        sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 2 max 20'
        #sshpass -p $PASSWORD ssh $USERNAME@$ILOIP 'fan p 3 max 20'
fi

