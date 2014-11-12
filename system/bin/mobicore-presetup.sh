#!/system/bin/sh
# Startup script for MobiCore processes #

sleep 1 
/system/bin/mcStarter

echo MobiCore startup script called...
# load kernel modules
insmod /system/lib/modules/mcdrvmodule.ko
insmod /system/lib/modules/mckernelapi.ko

# set device node permissions for TLC apps
chmod 700 /dev/mobicore
chmod 666 /dev/mobicore-user
chown system.system /dev/mobicore
chown radio.system /dev/mobicore-user

# mobicore trustlets
ln -s /system/app/mcRegistry/ffffffff000000000000000000000005.tlbin /data/app/mcRegistry/ffffffff000000000000000000000005.tlbin
chown system.system /data/app/mcRegistry/ffffffff000000000000000000000005.tlbin

# mobicore trustlets
ln -s /system/app/mcRegistry/ffffffff000000000000000000000006.tlbin /data/app/mcRegistry/ffffffff000000000000000000000006.tlbin
chown system.system /data/app/mcRegistry/ffffffff000000000000000000000006.tlbin

# mobicore trustlets
ln -s /system/app/mcRegistry/ffffffffd00000000000000000000006.tlbin /data/app/mcRegistry/ffffffffd00000000000000000000006.tlbin
chown system.system /data/app/mcRegistry/ffffffffd00000000000000000000006.tlbin

# mobicore trustlets
ln -s /system/app/mcRegistry/07010000000000000000000000000000.tlbin /data/app/mcRegistry/07010000000000000000000000000000.tlbin
chown system.system /data/app/mcRegistry/07010000000000000000000000000000.tlbin

# mobicore trustlets
ln -s /system/app/mcRegistry/ffffffff000000000000000000000009.tlbin /data/app/mcRegistry/ffffffff000000000000000000000009.tlbin
chown system.system /data/app/mcRegistry/ffffffff000000000000000000000009.tlbin

# mobicore trustlets
ln -s /system/app/mcRegistry/ffffffff000000000000000000000008.tlbin /data/app/mcRegistry/ffffffff000000000000000000000008.tlbin
chown system.system /data/app/mcRegistry/ffffffff000000000000000000000008.tlbin

# mobicore trustlets
ln -s /system/app/mcRegistry/ffffffff000000000000000000000004.tlbin /data/app/mcRegistry/ffffffff000000000000000000000004.tlbin
chown system.system /data/app/mcRegistry/ffffffff000000000000000000000004.tlbin

# mobicore trustlets
ln -s /system/app/mcRegistry/ffffffffd00000000000000000000004.tlbin /data/app/mcRegistry/ffffffffd00000000000000000000004.tlbin
chown system.system /data/app/mcRegistry/ffffffffd00000000000000000000004.tlbin

# run daemon in background
#/system/bin/mcDriverDaemon
