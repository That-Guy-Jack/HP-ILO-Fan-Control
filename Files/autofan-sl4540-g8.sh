#!/usr/bin/env bash

# Copyright (C) 2022-2022 York-Simon Johannsen <info@yosijo.de>
# SPDX-License-Identifier: AGPL-3.0-or-later

# chmod +x /autofan.sh

PASSWORD="YOURILOPASSWORD"
USERNAME="YOURILOUSER"
ILOIP="YOURILOIP"

T1="$(sensors -Aj coretemp-isa-0000 | jq '.[][] | to_entries[] | select(.key | endswith("input")) | .value' | sort -rn | head -n1)"
T2="$(sensors -Aj coretemp-isa-0001 | jq '.[][] | to_entries[] | select(.key | endswith("input")) | .value' | sort -rn | head -n1)"
[[ "${T1}" > "${T2}" ]] && T0="${T1}" || T0="${T2}"

function __ssh_ipmi_cmd() {
  sshpass \
    -p $PASSWORD \
    -- ssh \
      -oStrictHostKeyChecking=no \
      -oKexAlgorithms=+diffie-hellman-group14-sha1 \
      $USERNAME@$ILOIP \
      -- "${1}"
}

echo "=================="
echo "CPU max Temp $T0 C"
echo "=================="

if   [[ $T1 -gt 67 ]]; then __ssh_ipmi_cmd 'fan p 0 max 255';
elif [[ $T1 -gt 58 ]]; then __ssh_ipmi_cmd 'fan p 0 max 39';
elif [[ $T1 -gt 54 ]]; then __ssh_ipmi_cmd 'fan p 0 max 38';
elif [[ $T1 -gt 52 ]]; then __ssh_ipmi_cmd 'fan p 0 max 34';
elif [[ $T1 -gt 50 ]]; then __ssh_ipmi_cmd 'fan p 0 max 32';
else                        __ssh_ipmi_cmd 'fan p 0 max 30';
fi
