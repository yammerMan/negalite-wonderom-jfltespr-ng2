#!/sbin/sh

echo "" >> /system/build.prop
echo "# Graphics : Performance" >> /system/build.prop
echo "debug.egl.force_msaa=0" >> /system/build.prop
echo "persist.sys.use_dithering=0" >> /system/build.prop
