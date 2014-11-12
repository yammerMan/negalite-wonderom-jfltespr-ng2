#!/sbin/sh

echo "" >> /system/build.prop
echo "# Graphics : Quality" >> /system/build.prop
echo "debug.egl.force_msaa=1" >> /system/build.prop
echo "persist.sys.use_dithering=1" >> /system/build.prop
