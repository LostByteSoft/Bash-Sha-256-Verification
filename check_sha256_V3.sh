#!/bin/bash
#!/usr/bin/ffmpeg
## -----===== Start of bash =====-----
	printf '\033[8;30;80t'		# will resize the window, if needed.
	#printf '\033[8;40;75t'		# will resize the window, if needed.
	#printf '\033[8;40;125t'		# will resize the window, if needed.
	#printf '\033[8;50;200t'	# will resize the window, if needed.
echo -------------------------========================-------------------------
echo "Software lead-in"
	start=$SECONDS
	now=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now"
	echo
	echo Version compiled on : Also serves as a version
	echo 2022-02-02_Wednesday_08:15:14
echo -----------------------------------------------------------------------------
echo "Sha-256-sum verification, you will select 1 or 2 files"
echo "Version 3"
echo "By LostByteSoft"
echo "Version 2021-02-23"
echo -----------------------------------------------------------------------------

echo "MANDATORY - Select a file to hash (Could be anything)"
file="$(zenity --file-selection --filename=$HOME/$USER --title="MANDATORY - Select a file to hash (Could be anything)")"

echo -----------------------------------------------------------------------------

	echo file = "$file"
	export VAR2="$file"
	echo "$(dirname "${VAR2}")"
	echo "$(basename "${VAR2}")"
	
echo -----------------------------------------------------------------------------

exist="$file".sha256""
	if test -f "$exist"; then
	echo "exist, autoread"
	read -r firstline<"$file.sha256"

else
	echo "Associated sha256 file NOT exist, must select OR create"
echo "OPTIONAL - Select a file with the hash inside (*.sha256 *.txt)"
sha256file="$(zenity --file-selection --filename=$HOME/$USER --file-filter="*.sha256 *.txt" --title="OPTIONAL - Select a file with the hash inside (*.sha256 *.txt)")"


echo -----------------------------------------------------------------------------

{
if test -z "$sha256file"
	then
		echo "You don't have selected a file. You will create a new *.sha256 file"
		echo Press ENTER to continue the creation of a .sha256 file.
		read name
			cd /"$(dirname "${VAR1}")"
			echo -----------------------------------------------------------------------------
			echo "Your file to check is :"
			echo "$file"
			echo ------------------------
			echo The ckeck sum calculated is :
			sha256sum "$file" | awk '{print $1}' > "${file}.sha256"
			echo -----------------------------------------------------------------------------
			read -r firstline2<"${file}.sha256"
			export VAR3="$file"
			#echo "$(dirname "${VAR3}")"
			#echo "$(basename "${VAR3}")"
			#echo var is a var : "$(dirname "${VAR3}")"
			echo "$firstline2  $(basename "${VAR3}")" > "${file}.sha256"
			echo Is writen : "$firstline2  $(basename "${VAR3}")"
			echo -----------------------------------------------------------------------------
			echo You have created a new file with sum, press ENTER key to continue and compare !
			read name
			sha256file="${file}.sha256"
	else
	echo "File selected, "${file}.sha256""
fi
}

echo -----------------------------------------------------------------------------

	read -r firstline<"$sha256file"

fi
	# Debug echo
	#echo file="$file"
	#echo firstline="$firstline"
	#echo sha256file="$sha256file"
	#echo Press ENTER !
	#read name

echo -----------------------------------------------------------------------------

	#two file have ben provided.
	export VAR2="$file"
	echo dirname = "$(dirname "${VAR2}")"
	echo basename = "$(basename "${VAR2}")"
	echo -----------------------------------------------------------------------------
	sha256sum "$file" | awk '{print $1}' > "/dev/shm/"$(basename "${VAR2}")".sha256"
	read -r calsum<"/dev/shm/"$(basename "${VAR2}")".sha256"
	echo "The ckeck sum calculated is :"
	echo calsum = "$calsum"
	echo "$calsum $(basename "${VAR2}")" > "/dev/shm/"$(basename  "${VAR2}")".sha256"
	echo ------------------------
	echo "Your selected file for hash is : "
	echo $file
	echo ------------------------
	echo "Your selected sha256 file is : (Only if you have selected one) "
	echo "$sha256file"
	echo -------------------------------------------------------------
	calsum2=""$calsum"  "$(basename "${VAR2}")""
	#echo calsum... = "$calsum"  "$(basename "${VAR2}")"
	echo calsum2.. = "$calsum2"
	echo firstline = "$firstline"
	echo Visually compare !
	echo ------------------------
	
	red=`tput setaf 1`
	green=`tput setaf 2`
	reset=`tput sgr0`
	#echo "${red}red text ${green}green text${reset}"
	
	echo "And the final answer is .... :"
	if [ "$calsum2" = "$firstline" ]; then

	echo "${green}Sha256sum with compare hash is EQUAL${reset}"
	#echo "Sha256sum with compare hash is EQUAL"
	else
	
	echo "${red}Sha256sum with compare hash ARE NOT equal${reset}"
	#echo "Sha256sum with compare hash ARE NOT equal"
	fi

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
