


#!/bin/bash
cd ~/Desktop;
echo --- Start of file ---
# gnome-terminal --geometry 120x50				#won't work
echo "Create hash sha-256 file"
echo "By LostByteSoft"
echo "Version 2021-01-30"
echo "sha-256-sum hash, you will create 1 files"
echo  -----------------------------------------------------------------------------

echo "Select a file to hash"
FILE="$(zenity --file-selection --title="Select a file to hash")"

	echo -----------------------------------------------------------------------------
	echo "Your file to check is :"
	echo ------------------------
	echo "$FILE"
	echo The ckeck sum calculated is :
	sha256sum "$FILE" | awk '{print $1}' > "${FILE}.sha256"
	sha256sum "$FILE"
	echo -----------------------------------------------------------------------------
	echo "  $FILE" >> "${FILE}.sha256"
	echo You have created a new file with sum, press ENTER key to exit !

echo  -----------------------------------------------------------------------------

read name
exit
echo --- End of bash ---
