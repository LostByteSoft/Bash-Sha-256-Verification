


#!/bin/bash
cd ~/Desktop;
echo --- Start of file ---
# gnome-terminal --geometry 120x50				#won't work
echo "Create hash sha-512 file"
echo "By LostByteSoft"
echo "Version 2021-02-10"
echo "sha-512-sum hash, you will create 1 files"
echo  -----------------------------------------------------------------------------

echo "Select a file to hash"
FILE="$(zenity --file-selection --title="Select a file to hash")"

	echo -----------------------------------------------------------------------------
	echo "Your file to check is :"
	echo ------------------------
	echo "$FILE"
	echo The ckeck sum calculated is :
	sha512sum "$FILE" | awk '{print $1}' > "${FILE}.sha512"
	echo -----------------------------------------------------------------------------
	read -r firstline2<"${FILE}.sha512"
	echo "$firstline2  $FILE" > "${FILE}.sha512"
	echo Is writen : "$firstline2"  "$FILE"
	echo You have created a new file with sum, press ENTER key to exit !

echo  -----------------------------------------------------------------------------

read name
exit
echo --- End of bash ---
