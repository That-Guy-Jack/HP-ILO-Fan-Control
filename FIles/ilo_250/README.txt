PART NUMBER:  657149-021
FILE NAME:    iLO4_250.bin
TITLE:        iLO 4 firmware v2.50


LANGUAGE:  English


DIVISIONS:  Systems


PRODUCTS AFFECTED:

  HPE ProLiant BL660c Gen9 Server Blade   
  HPE ProLiant BL460c Gen9 Server Blade 
  HPE ProLiant DL580 Gen9 Server   
  HPE ProLiant DL560 Gen9 Server
  HPE ProLiant DL380 Gen9 Server  
  HPE ProLiant DL360 Gen9 Server 
  HPE ProLiant DL180 Gen9 Server 
  HPE ProLiant DL160 Gen9 Server 
  HPE ProLiant DL120 Gen9 Server
  HPE ProLiant DL80 Gen9 Server
  HPE ProLiant DL60 Gen9 Server
  HPE ProLiant DL20 Gen9 Server
  HPE ProLiant ML350 Gen9 Server 
  HPE ProLiant ML150 Gen9 Server
  HPE ProLiant ML110 Gen9 Server
  HPE ProLiant ML30 Gen9 Server
  HPE ProLiant XL450 Gen9 Server
  HPE ProLiant XL750f Gen9 Server
  HPE ProLiant XL740f Gen9 Server
  HPE ProLiant XL730f Gen9 Server
  HPE ProLiant XL250a Gen9 Server 
  HPE ProLiant XL230a Gen9 Server  
  HPE ProLiant XL230b Gen9 Server
  HPE ProLiant XL190r Gen9 Server    
  HPE ProLiant XL170r Gen9 Server    
  HPE ProLiant WS460c Gen9 Graphics Server Blade    
  HPE ProLiant EC200a Server
  HPE Synergy 480 Gen9 Compute Module
  HPE Synergy 620 Gen9 Compute Module
  HPE Synergy 660 Gen9 Compute Module	
  HPE Synergy 680 Gen9 Compute Module
  HPE ProLiant BL660c Gen8 Server Blade   
  HPE ProLiant BL465c Gen8 Server Blade   
  HPE ProLiant BL460c Gen8 Server Blade   
  HPE ProLiant BL420c Gen8 Server Blade
  HPE ProLiant DL580 Gen8 Server   
  HPE ProLiant DL560 Gen8 Server
  HPE ProLiant DL385p Gen8 Server   
  HPE ProLiant DL380p Gen8 Server   
  HPE ProLiant DL380e Gen8 Server   
  HPE ProLiant DL360p Gen8 Server   
  HPE ProLiant DL360e Gen8 Server   
  HPE ProLiant DL320e Gen8 v2 Server   
  HPE ProLiant DL320e Gen8 Server   
  HPE ProLiant DL160 Gen8 Server
  HPE ProLiant ML350e Gen8 Server   
  HPE ProLiant ML350p Gen8 Server   
  HPE ProLiant ML310e Gen8 v2 Server
  HPE ProLiant ML310e Gen8 Server
  HPE ProLiant SL4540 Gen8 Server   
  HPE ProLiant SL210t Gen8 Server   
  HPE ProLiant SL270s Gen8 Server   
  HPE ProLiant SL270s Gen8 SE Server   
  HPE ProLiant SL250s Gen8 Server   
  HPE ProLiant SL230s Gen8 Server 
  HPE ProLiant XL220a Gen8 Server
  HPE ProLiant MicroServer Gen8   
  HPE ProLiant WS460c Gen8 Graphics Server Blade   

OPERATING SYSTEM:
    Microsoft Windows Server 2008 *
    Microsoft Windows Server 2012, R2
    Microsoft Windows Server 2016
    Red Hat Enterprise Linux 6 (x86, AMD64/EM64T) 
    Red Hat Enterprise Linux 7
    SUSE Linux Enterprise Server 11 SP4 (x86, AMD64/EM64T)
    SUSE Linux Enterprise Server 12 SP1
    VMware vSphere 5.5, 6.0

    *Not supported on all platforms, see the OS support list for your platform. http://www.hpe.com/info/OSsupport 

SYSTEM CONFIGURATION:  N/A


PREREQUISITE:  N/A

BUILD DATE:  9/23/2016
EFFECTIVE DATE:  10/07/2016


DESCRIPTION:   Firmware for the Hewlett Packard Enterprise
               iLO 4 Management Controller
               
LAST RECOMMENDED OR CRITICAL VERSION: 2.44


PREVIOUS VERSION: 2.44


UPGRADE REQUIREMENTS: RECOMMENDED

  Users should update to this firmware version if their system is
  affected by one of the documented fixes or if there is a desire to utilize any
  of the enhanced functionality provided by this version.

  ***ATTENTION***
  Note for ESXi users: If you are booted from the Embedded SD Card, it is strongly 
  Recommended that you reboot the server immediately after updating to iLO 4 v2.50.

FIRMWARE DEPENDENCY:

  For best performance, IPv6 support, and TLS v1.1 or later support, 
  Hewlett Packard Enterprise recommends upgrading to the latest versions of the iLO 
  utilities:
  
  • HPQLOCFG 1.5.0 (replaced CPQLOCFG)
  • Lights-Out XML Scripting Sample 4.90 bundle
  • HPONCFG 4.8.0.0(Windows)
  • HPONCFG 4.6.0-0 (Linux)
  • LOCFG.PL 4.90(included in the Lights-Out XML Scripting Sample bundle)
  • HPLOMIG 4.80 (upgrade HPLOMIG before installing this version of iLO 4)

KNOWN ISSUES: 
  • On XL platforms with 1 or more HPE InfiniBand 100Gb 2-port 840QSFP28 installed there may be occasional communication issues with HPE Apollo Chassis Firmware.
  • In some situations, the idle timeout may fail to log you out of the iLO web interface.  Manually log out of iLO to mitigate this issue. An Integrated Remote Console session will correctly timeout if there is no keyboard, mouse, or virtual media activity for the timeout duration.
  • Due to a known issue in v53.0.2785.101 and v53.0.2785.116 of Chrome, the menu on the left side of the iLO web interface will not display. Use a different browser or newer version of Chrome.  http://h20564.www2.hpe.com/hpsc/doc/public/display?docId=c05289343The issue has been reported to Chrome. If necessary, zoom in/out will force the screen to repaint properly.
  • Internet Explorer 11 on Windows 2016 defaults to JavaScript disabled.  You will need to enable Active Scripting if you wish to use the iLO Web Interface.


Fixes:
The following issues are resolved in this version:
  • Dynamic Power Capping still works when set to disabled.
  • Server may shut down after repeated insertion and removal of hot-plug power input modules for RPS backplanes.  
  • Repeated LDAP tests cause iLO LDAP User Authentication to fail.
  • The reporting of location discovery services data via the RESTful API on ML/DL servers failed even with iLO Advanced license installed. 
  • Rare memory leak that could lead to slow or failed iLO interfaces due to unverified data returns from unregistered providers.
  • Corrected the link on the direct connect registration page to point to www.hpe.com/support/hpesc instead of www.hpe.com/services/hpesc.
  • OA communication issue after OneView SPP update.
  • Status of pure Fibre Channel cards show up as Unknown in Network Tab of iLO System Information.
  • External Rest Providers removed after upgrading BIOS, booting, and then resetting iLO.
  • Rarely a GET to the SNMP MIB will fail.
  • Rarely updates using HPSUT fail.
  • iLOs won't join Federation group or respond to SSDP requests if DHCPv4 is configured but an IP address is not obtained at iLO boot time.
  • Prev/Next links and list behavior of iLO federation are not consistent.
  • Security fixes/enhancements:
     -  Improved AlertMail message body encoding.
     -  CBC Mode ciphers disabled in FIPS/AES Modes (both Webserver and SSH).
     -  RC4 has been removed from the default cipher list.
     -  3DES and SHA-1 are disabled in FIPS mode.

Enhancements:
This version adds support for the following features and enhancements:
• Implemented Garbage collection on the RESTful API allowing for automatic recovery in the case of bad or missing data.
• Updates to the enclosure connection status (CPQSTSYS cpqSsBoxConnectionStatus) now correctly report when an enclosure is disconnected or reconnected, and sends trap cpqSsConnectionStatusChange where appropriate.
• This version adds protection to the lifespan of the embedded 4GB non-volatile storage (NAND) by implementing a daily write count limit that is well above the normal daily activity.  This ensures a runaway process will not inadvertently write to the NAND excessively leading to eventual failure.
• Changed the factory default certificate signing to SHA-256
• Added IP addresses to the SubjectAltName of the certificate.  

Feature previews:
  • Shared Network Port, port selection—Allows you to choose between port 1 and 
    port 2 for Shared Network Port functionality. You can configure this setting
    on the Network > Shared Network Port > General page in the iLO web interface. 
    
    NOTE: Not all sideband NICs are supported. In some cases, port 2 might not 
    be fully functional.

         NICs that work with port #2 for sideband:
         HPE FlexFabric 10Gb 2-port 556FLR-T Adapter
         HPE FlexFabric 10Gb 2-port 533FLR-T Adapter
         HPE Ethernet 10G 2-port 562FLR-SFP+ ALOM
         HPE Ethernet  10/25G 2-port 640FLR-SFP28 ALOM
         HPE FlexFabric 10Gb 4-port 536FLR-T Adapter
         361i-2port-1GB NIC
         331FLR-4P-1G NIC
         366FLR-4P- 1G NIC
         561FLR-T-2P-10GB NIC
         526FLR-SFP+2P-10GB NIC
         InfiniBand QDR/Ethernet 10Gb 2-port 544+FLR-QSFP Adapter **Port #2 Only
         534FLR-SFP+2P-10GB NIC
         Ethernet 1GB 2-port 330i Adapter
         BCM57810 NetXtreme II 10 GigE (NDIS VBD)
         FlexFabric 10Gb 2-port 554FLR-SFP+ Adapter
         Ethernet 10Gb 2P 560FLR-SFP+ Adapter
  

SUPPORT -

1.  iLO 4 firmware updates and utilities can be found here:

      http://www.hpe.com/support/iLO4

2. IPv6 network communications - Dedicated network connection only
     Supported Networking Features
                IPv6 Static Address Assignment
                IPv6 SLAAC Address Assignment
                IPv6 Static Route Assignment
                IPv6 Static Default Gateway Entry
                DHCPv6 Stateful Address Assignment
                DHCPv6 Stateless DNS, Domain Name, and NTP Configuration
                Integrated Remote Console
                OA Single Sign-On
                SIM Single Sign-On
                Web Server
                SSH Server
                SNTP Client
                DDNS Client
                RIBCL over IPv6
                SNMP
                AlertMail
                Remote Syslog
                WinDBG Support
                HPQLOCFG/HPLOMIG over an IPv6 connection
                Scriptable Virtual Media
                CLI/RIBCL Key Import over IPv6
                Authentication using LDAP and Kerberos over IPv6
                iLO Federation
                IPMI
     Networking Features not supported by IPv6 in this release 
                IPv6 Over Shared Network Port Connections
                NETBIOS-WINS
                Enterprise Secure Key Manager (ESKM) Support
                Embedded Remote Support (ERS)

3. You might encounter a “data inconsistency error” when you use iLO Federation
   Management. This error occurs when an iLO on your network is not 
   responding correctly. Use the data on the Multi-System map page to 
   troubleshoot data inconsistency errors.

DOCUMENTATION -

1.  iLO 4 documentation is available at http://www.hpe.com/info/iLO/docs.

2.  Check the online help for information about how to use iLO. To access the 
    online help, Click the question mark icon in the upper right corner of 
    any iLO web interface page.

HOW TO USE -

1.  Download the iLO 4 Online Firmware Update Component for your
    operating system.

2.  Install the firmware using one of these options:

    a) Run the component on the host to be updated.
       The component will update the iLO 4 firmware and reset the iLO processor.

    b) Extract the firmware from the component. This will place the firmware
       image file, iLo4_yyy.bin (where yyy represents the firmware version), in
       the target directory.  You now have these options:

       i) Login to iLO, navigate to the Update Firmware page, and update the
          firmware from there.

       ii) Use the Lights-Out Configuration Utility (HPQLOCFG) and RIBCL/XML
           scripts to update iLO 4 across the network.

       iii) Use the Online Lights-Out Configuration utility (HPONCFG) and
            RIBCL/XML scripts to update iLO 4 from the supported host OS.

3.  iLO automatically resets after a successful update.
    There is no need to manually reset iLO.

Copyright 2002,2016 Hewlett Packard Enterprise Development, LP

