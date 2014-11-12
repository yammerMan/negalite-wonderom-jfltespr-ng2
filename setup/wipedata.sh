#!/sbin/sh
 
# Wipe Data Without Wiping /data/media
find /data/* -maxdepth 0 -name 'media' -prune -o -exec rm -r '{}' ';'
