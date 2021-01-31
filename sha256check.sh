#!/bin/bash
echo --- Start of file ---
# gnome-terminal --geometry 120x50				#won't work
echo "Check hash sha-256 automaticly"
echo "By LostByteSoft"
echo "Version 2021-01-29"
echo "sha-256-sum verification, you will select 2 files"
echo  -----------------------------------------------------------------------------

echo "Select a file to hash"
FILE="$(zenity --file-selection --title="Select a file to hash")"

echo "Select a file with the hash inside"
sha256file="$(zenity --file-selection --title="Select a sha-256-file")"

read -r firstline<"$sha256file"

echo  -----------------------------------------------------------------------------
echo "Your file to check is :"
echo  ------------------------
echo "$FILE"
echo The ckeck sum calculated is :
sha256sum "$FILE"
echo  ------------------------
echo "$sha256file"
echo The ckeck sum in file is :
echo "$firstline"
echo  -----------------------------------------------------------------------------
echo Waiting 5 sec... Visually compare
sleep 5

echo If you have OK here it is OK !
sha256sum -c "$sha256file"

echo  -----------------------------------------------------------------------------
echo Press ENTER key to exit !
read name
exit
echo --- End of bash ---
