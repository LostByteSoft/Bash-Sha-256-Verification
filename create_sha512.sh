#!/bin/bash
#!/usr/bin/ffmpeg
## -----===== Start of bash =====-----

	printf '\033[8;30;80t'		# will resize the window, if needed.
	#printf '\033[8;50;200t'	# will resize the window, if needed.

	## Software lead in
	start=$SECONDS
	now=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now"

cd ~/Desktop;

echo  -----------------------------------------------------------------------------
echo "Create hash sha-512 file"
echo "By LostByteSoft"
echo "Version 2021-01-30"
echo "sha-512-sum hash, you will create 1 files"
echo  -----------------------------------------------------------------------------

echo "Select a file to hash"
FILE="$(zenity --file-selection --filename=$HOME/$USER --title="Select a file to hash")"

	cd /"$(dirname "${VAR1}")"
	echo -----------------------------------------------------------------------------
	echo "Your file to check is :"
	echo ------------------------
	echo "$FILE"
	echo The ckeck sum calculated is :
	sha512sum "$FILE" | awk '{print $1}' > "${FILE}.sha512"
	echo -----------------------------------------------------------------------------
	read -r firstline2<"${FILE}.sha512"
	export VAR3="$FILE"
	#echo "$(dirname "${VAR3}")"
	#echo "$(basename "${VAR3}")"
	#echo var is a var : "$(dirname "${VAR3}")"
	echo "$firstline2  $(basename "${VAR3}")" > "${FILE}.sha512"
	echo Is writen : "$firstline2  $(basename "${VAR3}")"
	echo To file: "${FILE}.sha512"
echo -------------------------========================-------------------------
## Software lead out.
	echo "Finish..."
	echo "This script take $(( SECONDS - start )) seconds to complete."
	date=$(date -d@$(( SECONDS - start )) -u +%H:%M:%S)
	echo "Time needed: $date"
	now=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now"
echo -------------------------========================-------------------------
## Press enter or auto-quit here.
	echo "If a script takes MORE than 120 seconds to complete it will ask you to"
	echo "press ENTER to terminate."
	echo
	echo "If a script takes LESS than 120 seconds to complete it will auto"
	echo "terminate after 10 seconds"
echo -------------------------========================-------------------------
## Exit, wait or auto-quit.
if [ $(( SECONDS - start )) -gt 120 ]
	then
	echo "Script takes more than 120 seconds to complete."
	echo Press ENTER key to exit !
	echo -------------------------========================-------------------------
	read name
	exit
fi
	echo "Script takes less than 120 seconds to complete."
	echo "Auto-quit in 10 sec. (You can press X)"
	echo -------------------------========================-------------------------
	sleep 10
	exit
## -----===== End of bash =====-----
## End-user license agreement (eula)

	JUST DO WHAT YOU WANT WITH THE PUBLIC LICENSE

	Version 3.1415926532 (January 2022)

	TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
   
	Everyone is permitted to copy and distribute verbatim or modified copies of
	this license document.

	As is customary and in compliance with current global and interplanetary
	regulations, the author of these pages disclaims all liability for the
	consequences of the advice given here, in particular in the event of partial
	or total destruction of the material, Loss of rights to the manufacturer
	warranty, electrocution, drowning, divorce, civil war, the effects of radiation
	due to atomic fission, unexpected tax recalls or encounters with
	extraterrestrial beings elsewhere.

	LostByteSoft no copyright or copyleft we are in the center.
## -----===== End of file =====-----
