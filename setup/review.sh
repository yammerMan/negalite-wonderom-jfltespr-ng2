#!/sbin/sh

if [ ! -e /sdcard/Negalite ]; then
	mkdir /sdcard/Negalite
fi

WIPE=/tmp/aroma/wipe.prop
LAUNCHER=/tmp/aroma/launcher.prop
XPOSED=/tmp/aroma/xposed.prop
PERFORMANCE=/tmp/aroma/performance.prop
GRAPHICS=/tmp/aroma/graphics.prop
KERNEL=/tmp/aroma/kernel.prop
SYSAPPS=/tmp/aroma/sysapps.prop
APPS=/tmp/aroma/apps.prop

S1="selected.0=1"
S2="selected.0=2"
S3="selected.0=3"
S4="selected.0=4"
S5="selected.0=5"

I1="item.0.1=1"
I2="item.0.2=1"
I3="item.0.3=1"
I4="item.0.4=1"
I5="item.0.5=1"
I6="item.0.6=1"
I7="item.0.7=1"
I8="item.0.8=1"
I9="item.0.9=1"
I10="item.0.10=1"
I11="item.0.11=1"
I12="item.0.12=1"

CHECK=/tmp/chkoptions.txt
REVIEW=/tmp/review.txt
SUMMARY=/tmp/summary.txt

touch $CHECK
chmod 777 $CHECK
echo "Backed-up options:" > $CHECK
echo "" >> $CHECK

################
# Data Wipe Options
################

echo "Data Wipe Selection:" >> $CHECK

if fgrep $S1 $WIPE; then
	echo "Wipe All data Except Internal SD" >> $CHECK
fi

if fgrep $S2 $WIPE; then
	echo "Skipping Data Wipe" >> $CHECK
fi

echo "" >> $CHECK

################
# TouchWiz Launcher Options
################

echo "TouchWiz Launcher Selection: (If Any)" >> $CHECK

if fgrep $S1 $LAUNCHER; then
	echo "Stock 4x4_4x5 Launcher" >> $CHECK
fi

if fgrep $S2 $LAUNCHER; then
	echo "4x5_5x6 Launcher" >> $CHECK
fi

echo "" >> $CHECK

################
# Xposed Options
################

echo "Xposed Selection:" >> $CHECK

if fgrep $I1 $XPOSED; then
	echo "National Roaming" >> $CHECK
fi

if fgrep $I2 $XPOSED; then
	echo "Disable MMS Lockscreen Notification" >> $CHECK
fi

echo "" >> $CHECK

################
# Performance Options
################

echo "Performance Selection:" >> $CHECK

if fgrep $S1 $PERFORMANCE; then
	echo "Low Performance" >> $CHECK
fi

if fgrep $S2 $PERFORMANCE; then
	echo "Mixed Performance" >> $CHECK
fi

if fgrep $S3 $PERFORMANCE; then
	echo "High Performance" >> $CHECK
fi

echo "" >> $CHECK

################
# Graphics Options
################

echo "Graphics Selection:" >> $CHECK

if fgrep $S1 $GRAPHICS; then
	echo "Quality Graphics" >> $CHECK
fi

if fgrep $S2 $GRAPHICS; then
	echo "Performance Graphics" >> $CHECK
fi

echo "" >> $CHECK

################
# Kernel Options
################

echo "Kernel Selection:" >> $CHECK

if fgrep $S1 $KERNEL; then
	echo "Negalite NAE Kernel" >> $CHECK
fi

if fgrep $S2 $KERNEL; then
	echo "Stock NAE Kernel" >> $CHECK
fi

echo "" >> $CHECK

################
# Apps Options
################

echo "System App Options:" >> $CHECK

if [ -e $SYSAPPS ]; then

	if fgrep $I1 $SYSAPPS; then
		echo "Adobe Reader" >> $CHECK
	fi

	if fgrep $I2 $SYSAPPS; then
		echo "Facebook" >> $CHECK
	fi

	if fgrep $I3 $SYSAPPS; then
		echo "Flash Player" >> $CHECK
	fi

	if fgrep $I4 $SYSAPPS; then
		echo "Google+" >> $CHECK
	fi

	if fgrep $I5 $SYSAPPS; then
		echo "Google Chrome" >> $CHECK
	fi

	if fgrep $I6 $SYSAPPS; then
		echo "Google Mail" >> $CHECK
	fi

	if fgrep $I7 $SYSAPPS; then
		echo "Google Maps" >> $CHECK
	fi

	if fgrep $I8 $SYSAPPS; then
		echo "Google Now" >> $CHECK
	fi

	if fgrep $I9 $SYSAPPS; then
		echo "Google Videos" >> $CHECK
	fi

	if fgrep $I10 $SYSAPPS; then
		echo "Google Voice" >> $CHECK
	fi

	if fgrep $I11 $SYSAPPS; then
		echo "YouTube" >> $CHECK
	fi
fi

echo "" >> $CHECK

echo "App Options:" >> $CHECK

if [ -e $APPS ]; then

	if fgrep $I1 $APPS; then
		echo "AdAway" >> $CHECK
	fi

	if fgrep $I2 $APPS; then
		echo "Android Terminal" >> $CHECK
	fi

	if fgrep $I3 $APPS; then
		echo "Cache Cleaner NG" >> $CHECK
	fi

	if fgrep $I4 $APPS; then
		echo "FX File Explorer" >> $CHECK
	fi

	if fgrep $I5 $APPS; then
		echo "MX Player" >> $CHECK
	fi

	if fgrep $I6 $APPS; then
		echo "Playstation Mobile" >> $CHECK
	fi

	if fgrep $I7 $APPS; then
		echo "Script-Manager" >> $CHECK
	fi

	if fgrep $I8 $APPS; then
		echo "System Tuner" >> $CHECK
	fi

	if fgrep $I9 $APPS; then
		echo "Titanium Backup" >> $CHECK
	fi

	if fgrep $I10 $APPS; then
		echo "Ultimate Backup" >> $CHECK
	fi

	if fgrep $I11 $APPS; then
		echo "Volume Sync" >> $CHECK
	fi

	if fgrep $I12 $APPS; then
		echo "Wifi Tether" >> $CHECK
	fi
fi

echo "" >> $CHECK

################
# File Settings
################

if [ -e /tmp/aroma/restore.prop ]; then
	if [ ! -e $REVIEW ]; then
		mv $CHECK $REVIEW
		chmod 777 $REVIEW
	fi
else
	if [ ! -e $SUMMARY ]; then
		mv $CHECK $SUMMARY
		chmod 777 $SUMMARY
	fi
fi

if [ -e /sdcard/Negalite/summary.txt ]; then
	cp -f $SUMMARY /sdcard/Negalite/summary.txt
else
	mv $SUMMARY /sdcard/Negalite/summary.txt
fi

if [ -e /sdcard/Negalite/review.txt ]; then
	cp -f $REVIEW /sdcard/Negalite/review.txt
else
	mv $REVIEW /sdcard/Negalite/review.txt
fi

sleep 3
