#Credit to Ninja-FSE for this in https://github.com/That-Guy-Jack/HP-ILO-Fan-Control/issues/33
#!/bin/bash
# ==================== CONFIGURATION ====================
PASSWORD="YOUR_ILO_PASSWORD"
USERNAME="YOUR_ILO_USERNAME"
ILOIP="YOUR_ILO_IP"
# =======================================================

# 1. Fetch raw data silently via separate SSH calls (Does not crash iLO)
RAW_CPU1=$(sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no "$USERNAME"@"$ILOIP" "show /system1/sensor2" 2>/dev/null)
RAW_CPU2=$(sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no "$USERNAME"@"$ILOIP" "show /system1/sensor3" 2>/dev/null)
RAW_HD=$(sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no "$USERNAME"@"$ILOIP" "show /system1/sensor31" 2>/dev/null)

# 2. Extract only the digits from CurrentReading
T1=$(echo "$RAW_CPU1" | grep "CurrentReading" | cut -d'=' -f2 | tr -cd '0-9')
T2=$(echo "$RAW_CPU2" | grep "CurrentReading" | cut -d'=' -f2 | tr -cd '0-9')
THD=$(echo "$RAW_HD" | grep "CurrentReading" | cut -d'=' -f2 | tr -cd '0-9')

# Print temperatures on screen (good for logs and manual execution)
echo "CPU 1 Temp: ${T1}°C"
echo "CPU 2 Temp: ${T2}°C"
echo "HD Controller Temp: ${THD}°C"

# SAFETY INTERRUPT: If any value is missing, abort immediately without changing the fans
if [ -z "$T1" ] || [ -z "$T2" ] || [ -z "$THD" ]; then
    echo "NOTE: Could not read sensors. Skipping fan adjustment."
    exit 0
fi

# 3. Fan speed logic (Both zones take the highest value of CPU or HD Controller)
if [[ $T1 -gt 87 ]] || [[ $THD -gt 88 ]]; then SPEED_Z1=80
elif [[ $T1 -gt 77 ]] || [[ $THD -gt 84 ]]; then SPEED_Z1=70
elif [[ $T1 -gt 67 ]] || [[ $THD -gt 80 ]]; then SPEED_Z1=45
elif [[ $T1 -gt 58 ]] || [[ $THD -gt 75 ]]; then SPEED_Z1=35
elif [[ $T1 -gt 54 ]] || [[ $THD -gt 70 ]]; then SPEED_Z1=30
elif [[ $T1 -gt 52 ]] || [[ $THD -gt 65 ]]; then SPEED_Z1=26
elif [[ $T1 -gt 50 ]] || [[ $THD -gt 60 ]]; then SPEED_Z1=22
else SPEED_Z1=20
fi

if [[ $T2 -gt 87 ]] || [[ $THD -gt 88 ]]; then SPEED_Z2=80
elif [[ $T2 -gt 77 ]] || [[ $THD -gt 84 ]]; then SPEED_Z2=70
elif [[ $T2 -gt 67 ]] || [[ $THD -gt 80 ]]; then SPEED_Z2=45
elif [[ $T2 -gt 58 ]] || [[ $THD -gt 75 ]]; then SPEED_Z2=35
elif [[ $T2 -gt 54 ]] || [[ $THD -gt 70 ]]; then SPEED_Z2=30
elif [[ $T2 -gt 52 ]] || [[ $THD -gt 65 ]]; then SPEED_Z2=26
elif [[ $T2 -gt 50 ]] || [[ $THD -gt 60 ]]; then SPEED_Z2=22
else SPEED_Z2=20
fi

echo "Decision -> Setting Zone 1 to ${SPEED_Z1}% and Zone 2 to ${SPEED_Z2}%"

# 4. Send control commands SAFELY (One command at a time via loop)
# Fan 4-7 (Zone 1)
for fan in 4 5 6 7; do
    sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no "$USERNAME"@"$ILOIP" "fan p $fan max $SPEED_Z1" 2>/dev/null
    sleep 0.1
done

# Fan 0-3 (Zone 2)
for fan in 0 1 2 3; do
    sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no "$USERNAME"@"$ILOIP" "fan p $fan max $SPEED_Z2" 2>/dev/null
    sleep 0.1
done

echo "Fans have been updated successfully."