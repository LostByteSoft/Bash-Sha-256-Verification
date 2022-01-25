#!/bin/bash
#!/usr/bin/ffmpeg
## -----===== Start of bash =====-----

	printf '\033[8;30;80t'		# will resize the window, if needed.
	#printf '\033[8;50;200t'	# will resize the window, if needed.

	## Software lead in
	start=$SECONDS
	now=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now"

echo -----------------------------------------------------------------------------
echo "create_sha256_folder_V3.1"
echo "Create hash sha-256 file for all files in folder specified, only one hash file"
echo "By LostByteSoft"
echo "Version 2021-11-30"
echo -----------------------------------------------------------------------------

	red=`tput setaf 1`
	green=`tput setaf 2`
	reset=`tput sgr0`

echo ${green}Must select the folder you want to make sha file.${reset}
echo Will create an " sha256sums.sha256 " in the folder you specify.
echo ${red}!!! Carefull ALL fileS in the folder you specify will be hashed !!! Could be very long.${reset}
echo press ENTER to continue!

echo -----------------------------------------------------------------------------
read name

way="$(zenity --file-selection --title="Choose a directory to hash all file" --filename=$HOME/$USER --directory)"

	export VAR1="$way"
	echo dirname = "$(dirname "${VAR1}")"
	echo basename = "$(basename "${VAR1}")"
	touch ""$(dirname "${VAR1}")"/"$(basename "${VAR1}")"/sha256sums.sha256"
	echo way = "$way"

echo "Wait until it finishes..."

echo -----------------------------------------------------------------------------

	
for i in "$way"/*.*;
	do name=`echo "$i" `
	# echo name="$name"
	export VAR="$i"
	sha256sum "$name" | awk '{print $1}' > "/dev/shm/sha256sums.sha256"
	read -r firstline<"/dev/shm/sha256sums.sha256"
	echo "$firstline  $(basename "${VAR}")" >> ""$way"/sha256sums.sha256"
	echo Is writen : ""$firstline"  "$(basename "${VAR}")""
	done

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
