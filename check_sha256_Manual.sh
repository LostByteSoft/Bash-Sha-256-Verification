#!/bin/bash
#!/usr/bin/ffmpeg
## -----===== Start of bash =====-----
	start=$SECONDS
	## "NEVER remove dual ## in front of lines. Theses are code annotations."
	## "You can test / remove single # for testing purpose."
	#printf '\033[8;40;90t'		# will resize the window, if needed.
	printf '\033[8;40;100t'		# will resize the window, if needed.
	#printf '\033[8;40;130t'		# will resize the window, if needed.
	#sleep 0.50
	now=$(date +"%Y-%m-%d_%A_%H:%M:%S")
	red=`tput setaf 1`
	green=`tput setaf 2`
	yellow=`tput setaf 11`
	blue=`tput setaf 12`
	reset=`tput sgr0`
	echo

echo -------------------------========================-------------------------
	## All variables 0 or 1
	autoquit=0	# autoquit anyway to script takes LESS than 2 min to complete.
	debug=0		# test debug
	error=0		# test error
	part=0		# don't change this value
	noquit=1	# No quit after all operations.
	random=$RANDOM	# Used for temp folders
	echo "Software lead-in. LostByteSoft ; https://github.com/LostByteSoft"
	echo
	echo "Current time : $now"
	echo "Common variables, you can changes theses variables as you wish to test."
	echo
	echo "Debug data : autoquit=$autoquit debug=$debug error=$error part=$part noquit=$noquit random=$random"

echo -------------------------========================-------------------------
sleep 0.50
	echo "Color codes / Informations."
	echo
	echo  "${green}	████████████████     ALL OK / ACTIVE      ████████████████ ${reset}"
	echo   "${blue}	████████████████      INFORMATION(S)      ████████████████ ${reset}"
	echo "${yellow}	████████████████   ATTENTION / INACTIVE   ████████████████ ${reset}"
	echo    "${red}	████████████████   FATAL ERROR / OFFLINE  ████████████████ ${reset}"
	echo
echo -------------------------========================-------------------------
	echo Version compiled on : Also serves as a version
	echo 2023-03-01_Wednesday_09:27:05
	echo
## Software name, what is this, version, informations.
	echo "Software name: check sha256 Manual Input"
	echo "File name : check_sha256_Manual.sh"
	echo
	echo "What it does ? Compare the calculated sha-256 of a file with an sha-256 you specified."
	echo
	echo "Informations : (EULA at the end of file, open in text.)"
	echo "By LostByteSoft, no copyright or copyleft."
	echo "https://github.com/LostByteSoft"
	echo
	echo "Don't hack paid software, free software exists and does the job better."

echo -------------------------========================-------------------------
echo "Select filename using dialog !"

	file="$(zenity --file-selection --filename=$HOME/$USER --title="Select a file, all format supported")"

if test -z "$file"
	then
		echo "You don't have selected a file, now exit in 3 seconds."
		echo -------------------------========================-------------------------
		sleep 3
		exit
	else
		echo "You have selected :"
		echo "$file"
fi

echo -------------------------========================-------------------------

	entry=$(zenity --entry --width 550 --title "Check sha-256" --text "Copy paste sha-256 here. ( NOT case sensitive. )")

if test -z "$entry"
	then
		echo "You don't have entered an sha-256, now exit in 3 seconds."
		echo -------------------------========================-------------------------
		sleep 3
		exit
	else
		echo "You have entered :"
		echo "$entry"
fi

echo -------------------------========================-------------------------
echo "Input name, directory and output name : (Debug helper)"
## Set working path.
	dir=$(pwd)
	echo "Working dir : "$dir""
	echo Input file : "$file"
	export VAR="$file"
	echo
	echo Base directory : "$(dirname "${VAR}")"
	echo Base name: "$(basename "${VAR}")"
	echo
## Output file name
	name=`echo "$file" | rev | cut -f 2- -d '.' | rev` ## remove extension
	echo "Output name ext : "$name""
	name1=`echo "$(basename "${VAR}")" | rev | cut -f 2- -d '.' | rev` ## remove extension
	echo "Output name bis : "$name1""
	
echo -------------------------========================-------------------------
## The code program.

	entry="$(echo $entry | tr '[A-Z]' '[a-z]')"
	echo "sha256sum "$file" | awk '{print $1}'"
	sha256sum "$file" | awk '{print $1}' > "/dev/shm/"$(basename "${VAR}")".sha256"
	read -r calsum<"/dev/shm/"$(basename "${VAR}")".sha256"
	echo "Your selected file for hash is : "
	echo $file
	echo "The ckeck sum calculated is :"
	echo calsum = "$calsum"
	echo
	echo Visually compare these two lines !
	echo calsum = "$calsum"
	echo entry. = "$entry"

## Verify if 2 variable is equal	
	echo "And the final answer is .... :"
	
if [ "$calsum" = "$entry" ]; then
	echo "${green}████████████████████████████████████████${reset}"
	echo "${green}██Sha256sum with compare hash is EQUAL██${reset}"
	echo "${green}████████████████████████████████████████${reset}"
	
	if zenity --question --no-wrap --text="Do you want to create a sha256 file associed ?"
		then 
		echo The ckeck sum calculated is :
		sha256sum "$file" | awk '{print $1}' > "${file}.sha256"
		read -r firstline2<"${file}.sha256"
		echo "$firstline2  $(basename "${VAR}")" > "${file}.sha256"
		echo Is writen : "$firstline2  $(basename "${VAR}")"
		echo To file: "${file}.sha256"
	fi

		else
		echo "${red}█████████████████████████████████████████████${reset}"	
		echo "${red}██Sha256sum with compare hash ARE NOT equal██${reset}"
		echo "${red}█████████████████████████████████████████████${reset}"
fi

echo -------------------------========================-------------------------
## Software lead out
	echo "Finish... with numbers of actions : $part"
	echo "This script take $(( SECONDS - start )) seconds to complete."
	date=$(date -d@$(( SECONDS - start )) -u +%H:%M:%S)
	echo "Time needed: $date"
	now=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now"
	echo
echo -------------------------========================-------------------------
	echo "If a script takes MORE than 120 seconds to complete it will ask"
	echo "you to press ENTER to terminate."
	echo
	echo "If a script takes LESS than 120 seconds to complete it will auto"
	echo "terminate after 10 seconds"
echo -------------------------========================-------------------------
## Exit, wait or auto-quit.
	if [ "$noquit" -eq "1" ]; then
		echo
		echo "${blue}	█████████████████ NO exit activated ███████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to exit !"
		exit
		fi

	if [ "$autoquit" -eq "1" ]
		then
			echo
			echo "${green}	███████████████ Finish, quit in 3 seconds █████████████████${reset}"
			echo
			sleep 2
			echo
		else
		{
			if [ "$debug" -eq "1" ]; then
				echo
				echo "${blue}		█████ DEBUG WAIT | Program finish. █████${reset}"
				echo
				echo "Debug data : autoquit=$autoquit debug=$debug error=$error part=$part noquit=$noquit random=$random"
				echo
				read -n 1 -s -r -p "Press ENTER key to continue !"
				echo
			fi
		if [ $(( SECONDS - start )) -gt 120 ]
			then
				echo
				echo "Script takes more than 120 seconds to complete."
				echo
				echo "${blue}	█████████████████████ Finish ███████████████████████${reset}"
				echo
				read -n 1 -s -r -p "Press ENTER key to exit !"
				echo
			else
				echo
				echo "Script takes less than 120 seconds to complete."
				echo
				echo "${green}	█████████████████████ Finish ███████████████████████${reset}"
				echo
				echo "Auto-quit in 3 sec. (You can press X)"
				echo
				sleep 3
			fi
		}
		fi
	exit

## -----===== End of bash =====-----

	End-user license agreement (eula)

 	JUST DO WHAT THE F*** YOU WANT WITH THE PUBLIC LICENSE
 	
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
 	
 	YOU MUST ACCEPT THESES TERMS OR NOTHING WILL HAPPEN.
 	
 	LostByteSoft no copyright or copyleft we are in the center.
 	
 	You can send your request and your Christmas wishes to this address:
 	
 		Père Noël
 		Pôle Nord, Canada
 		H0H 0H0

## -----===== End of file =====-----
