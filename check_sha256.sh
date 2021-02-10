echo --- Start of file ---
#!/bin/bash
cd "$(dirname "$0")"
# gnome-terminal --geometry 120x50				#won't work
echo "Check hash sha-256 automaticly"
echo "By LostByteSoft"
echo "Version 2021-02-10"
echo "sha-256-sum verification, you will select 1 or 2 files"
echo -----------------------------------------------------------------------------

echo "MANDATORY - Select a file to hash (Could be anything)"
FILE="$(zenity --file-selection --filename=$HOME/$USER --title="MANDATORY - Select a file to hash (Could be anything)")"

# must set the working dir at the location of var FILE
	export VAR1="$FILE"
	#echo "$(dirname "${VAR1}")"
	#echo "$(basename "${VAR1}")"
	echo var is a var : "$(dirname "${VAR1}")"
	#echo For debug purpose press a key !
	#read name

# if exist file then load
# else "no, select a file"

echo "OPTIONAL - Select a file with the hash inside (*.sha256)"
sha256file="$(zenity --file-selection --filename=$HOME/$USER --title="OPTIONAL - Select a file with the hash inside (*.sha256)")"

	export VAR2="$FILE"
	#echo "$(dirname "${VAR2}")"
	#echo "$(basename "${VAR2}")"
	echo var is a var : "$(dirname "${VAR2}")"
	#echo For debug purpose press a key !
	#read name

if [ "$sha256file" = "" ]; then
	#echo "Only one file was provided."
	cd /"$(dirname "${VAR1}")"
	echo -----------------------------------------------------------------------------
	echo "Your file to check is :"
	echo ------------------------
	echo "$FILE"
	echo The ckeck sum calculated is :
	sha256sum "$FILE" | awk '{print $1}' > "${FILE}.sha256"
	sha256sum "$FILE"
	echo -----------------------------------------------------------------------------
	read -r firstline2<"${FILE}.sha256"
	export VAR3="$FILE"
	#echo "$(dirname "${VAR3}")"
	#echo "$(basename "${VAR3}")"
	#echo var is a var : "$(dirname "${VAR3}")"
	echo "$firstline2  $(basename "${VAR3}")" > "${FILE}.sha256"
	echo Is writen : "$firstline2  $(basename "${VAR3}")"
	echo -----------------------------------------------------------------------------
	echo You have created a new file with sum, press ENTER key to exit !
	read name
	exit

else
	#echo "You have provided two files."
	cd /"$(dirname "${VAR2}")"
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

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   Version 3.14159265358979323846264338327950288419716939937510582
                          February 2021

   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
   
  	 Everyone is permitted to copy and distribute verbatim
 		or modified copies of this license document.

	  As is customary and in compliance with current global and
	interplanetary regulations, the author of these pages disclaims
	all liability for the consequences of the advice given here,
	in particular in the event of partial or total destruction of
	the material, Loss of rights to the manufacturer's warranty,
	electrocution, drowning, divorce, civil war, the effects of
	radiation due to atomic fission, unexpected tax recalls or
	    encounters with extraterrestrial beings 'elsewhere.

      LostByteSoft no copyright or copyleft we are in the center.

--- End of file ---
