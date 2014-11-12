#!/system/bin/sh

NEGALITE=negalite-wonderom

if [ -e /sdcard/negalite-s4 ] || [ -e /sdcard/OASVNlite ] || [ -e /sdcard/OASVN ]; then

	MYPATH=`realpath $0`
	cd `dirname $MYPATH`

	LINE="$(sed -n '4{p;q;}' .svn/entries)"

	echo "OASVN/MobileSVN Detected! - Zipping"
	sleep 2
	echo "."
	echo "."
	echo "Current Revision is: r$LINE"
	sleep 2

	zip -5 negalite_wonderom-ng2-x-r$LINE.zip -r applications_optional applications_optional_system kernel keyboard launcher META-INF mod_xposed performance recovery setup sound superuser system user_apps -x "*.svn*"

	if [ -e negalite-wonderom-ng2-x-r$LINE.zip ]; then
		echo "Done, Now Go Flash This Baby!"
	else
		echo "Something went wrong... No Zip exists. Make sure your SVN is updated to the latest revision..."
	fi
else

	echo "Linux Detected - Zipping, Signing and Renaming"
	sleep 3

#	NEGAZIP=./zzz-NegaZip-Linux

	zip -9 ./$NEGALITE.zip -r ./applications_optional ./applications_optional_system ./kernel ./keyboard ./launcher ./META-INF ./mod_xposed ./performance ./recovery ./setup ./sound ./superuser ./system ./user_apps -x "*.svn*"

#	mv ./$NEGALITE.zip $NEGAZIP/$NEGALITE.zip

	REVISION="$(svn info http://negalite-wonderom-jfltespr-ng2-x.googlecode.com/svn/ | grep "^Revision:" | cut -c 11-)"

#	chmod 775 $NEGAZIP/signapk.jar

	echo "."
	echo "."
	echo "Current Revision is: r$REVISION"
#	echo "."
#	echo "."
#	sleep 2
#	echo "Signing negalite_wonderom_r$REVISION"
	echo "."
	echo "."

#	java -jar $NEGAZIP/signapk.jar $NEGAZIP/certificate.pem $NEGAZIP/key.pk8 $NEGAZIP/$NEGALITE.zip $NEGAZIP/$NEGALITE.sig

	mv ./$NEGALITE.zip ./negalite-wonderom-ng2-x-r$REVISION.zip

#	if [ -e $NEGAZIP/$NEGALITE.zip ]; then
#		rm $NEGAZIP/$NEGALITE.zip
#	fi

	if [ -e ./negalite-wonderom-ng2-x-r$REVISION.zip ]; then
		echo "Done, Now Go Flash This Baby!"
	else
		echo "Something went wrong... No Zip exists. Make sure your SVN is updated to the latest revision..."
	fi
fi
