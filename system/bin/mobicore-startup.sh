#!/system/bin/sh
# Startup script for MobiCore processes #

sleep 5 

# run mcStarter in background
#/system/bin/mcStarter

# run daemon in background
/system/bin/mcDriverDaemon -r /system/app/mcRegistry/FFFFFFFF000000000000000000000001.drbin
