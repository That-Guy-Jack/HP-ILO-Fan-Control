# About the iLO Security Override Switch

The iLO security override switch allows the user of the iLO enabled system to take complete control over their iLO instance. Setting the switch disables user authentication on the iLO, allowing anyone to log-in with `Administrator` and a blank password. The iLO security override switch also allows the user to flash an iLO version that is lower than the current version, or an unsigned version. This is useful for us, as it allows us to flash the modified firmware onto the iLO, allowing us to take control of the fan speeds.

## DISCLAIMER

By setting this switch, and proceeding to flash the firmware onto the iLO, it is possible that you render your iLO chip inoperable. If this occurs, you will need to replace the motherboard on the server in particular. By flashing a custom firmware onto iLO, if you happen to have an HPE warranty on the server in question, expect that warranty to be voided. While this method is preferred to any hardware modifications, it is not without risk. Please tread carefully as you read the instructions, do not glance over them.

## OFFICAL HPE DOCUMENTATION

iLO Security Override Switch

The iLO Security Override Switch grants the administrator full access to the iLO processor. This
access might be necessary for any of the following conditions:

•   iLO has been disabled and must be re-enabled.

•   All user accounts that have the Administer User Accounts privilege are locked out.

•   An invalid configuration prevents iLO from being displayed on the network, and iLO RBSU
or the iLO 4 Configuration Utility is disabled.

•   The boot block must be flashed.

•   The iLO NIC is turned off, and running iLO RBSU or the iLO 4 Configuration Utility to turn it
back on is not possible or convenient.

•   Only one user name is configured, and the password is forgotten.

Ramifications of setting the iLO Security Override Switch include the following:

•   All security authorization verifications are disabled when the switch is set.

•   iLO RBSU or the iLO 4 Configuration Utility runs if the host server is reset.

•   iLO is not disabled and might be displayed on the network as configured.

iLO, if disabled when the switch is set, does not log out the user and complete the disable
process until the power is cycled on the server.

•   The boot block is exposed for programming.

•   A warning message is displayed on iLO web interface pages, indicating that the switch is
currently in use.

•   An iLO log entry records the use of the switch.

When iLO boots after you set or clear the iLO Security Override Switch, an SNMP alert is sent if
an SNMP Alert Destination is configured.

Setting the iLO Security Override Switch enables you to flash the iLO boot block. HP does not
anticipate that you will need to update the boot block. However, if an update is required, you must
be physically present at the server to reprogram the boot block and reset iLO. The boot block is
exposed until iLO is reset. For maximum security, HP recommends disconnecting iLO from the
network until the reset is complete. You must open the server enclosure to access the iLO Security
Override Switch.

To set the iLO Security Override Switch:

1. Power off the server.

2. Set the switch.

3. Power on the server.

Reverse this procedure to clear the iLO Security Override Switch.

