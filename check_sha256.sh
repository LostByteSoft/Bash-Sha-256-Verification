#!/bin/bash
echo --- Start of file ---
# gnome-terminal --geometry 120x50				#won't work
echo "Check hash sha-256 automaticly"
echo "By LostByteSoft"
echo "Version 2021-01-29"
echo "sha-256-sum verification, you will select 1 or 2 files"
echo -----------------------------------------------------------------------------

echo "MANDATORY - Select a file to hash (Could be anything)"
FILE="$(zenity --file-selection --title="MANDATORY - Select a file to hash (Could be anything)")"

# if exist file then load
# else "no, select a file"

echo "OPTIONAL - Select a file with the hash inside (*.sha256)"
sha256file="$(zenity --file-selection --title="OPTIONAL - Select a file with the hash inside (*.sha256)")"

if [ "$sha256file" = "" ]; then
	echo "variable is empty"
	# NO sha 256 file include version
	echo -----------------------------------------------------------------------------
	echo "Your file to check is :"
	echo ------------------------
	echo "$FILE"
	echo The ckeck sum calculated is :
	sha256sum "$FILE" | awk '{print $1}' > "${FILE}.sha256"
	sha256sum "$FILE"
	echo -----------------------------------------------------------------------------
	read -r firstline2<"${FILE}.sha256"
	echo "$firstline2  $FILE" > "${FILE}.sha256"
	echo Is writen : "$firstline2"   "$FILE"
	echo -----------------------------------------------------------------------------
	echo You have created a new file with sum, press ENTER key to exit !
	read name
	exit

	
else
	echo "everything OK"
	#sha256 file include
	echo -----------------------------------------------------------------------------
	read -r firstline<"$sha256file"
	echo "Your file to check is :"
	echo ------------------------
	echo "$FILE"
	echo The ckeck sum calculated is :
	sha256sum "$FILE"
	echo ------------------------
	echo "$sha256file"
	echo The ckeck sum in file is :
	echo "$firstline"
	echo Visually compare !
	echo  -----------------------------------------------------------------------------
	echo If you have OK here it is OK !
	sha256sum -c "$sha256file"
	echo -----------------------------------------------------------------------------
	echo Press ENTER key to exit !
	read name
	exit

fi

echo Error 001 - Press ENTER key to exit !
read name
exit

echo --- End of bash ---
