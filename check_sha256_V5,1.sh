#!/bin/bash
#!/usr/bin/ffmpeg
## -----===== Start of bash =====-----
	start=$SECONDS
	## "NEVER remove dual ## in front of lines. Theses are code annotations."
	## "You can test / remove single # for testing purpose."
	#printf '\033[8;40;90t'		# will resize the window, if needed.
	#printf '\033[8;40;100t'		# will resize the window, if needed.
	printf '\033[8;40;130t'		# will resize the window, if needed.
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
	echo What it does ?
	echo "Sha-256-sum verification, you will select 1 or 2 files"
	echo "check_sha256_V5"
echo
	echo Informations :
	echo "By LostByteSoft, no copyright or copyleft"
	echo "https://github.com/LostByteSoft"
	echo
	echo "Version 5"
	echo "This software is CASE sensitive."
	echo "Must by have 2 space between name and sha in *.sha256 file"
	echo "Version 2021-02-25 Original release"
	echo "Version 2021-11-17 small update"
	echo "Version 2022-01-23 - version 5"
	echo "Version 2022-03-01 - version 5.1 - lead in lead out update"
echo
echo -------------------------========================-------------------------
echo "Select filename using dialog !"

	file="$(zenity --file-selection --filename=$HOME/$USER --title="Select a file, all format supported")"
	#file=$(zenity  --file-selection --filename=$HOME/$USER --title="Choose a directory to convert all file" --directory)
	## --file-filter="*.jpg *.gif"

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
	echo "Input name, directory and output name : (Debug helper)"
	echo
## Set working path.
	BASEDIR=$(dirname "$0")
	echo Basedir : "$BASEDIR"
	dir=$(pwd)
## file or folder selected
	echo "Working dir : "$dir""
	echo Input file : "$file"
	export VAR="$file"
	echo
## directory section
	INPUT="$(dirname "${VAR}")"	
	echo "Get the last Folder : ${INPUT##*/}"
	echo Base directory : "$(dirname "${VAR}")"
	echo Base name: "$(basename "${VAR}")"
	echo
## Output file name
	name=`echo "$file" | rev | cut -f 2- -d '.' | rev` ## remove extension
	echo "Output name ext : "$name""
	name1=`echo "$(basename "${VAR}")" | rev | cut -f 2- -d '.' | rev` ## remove extension
	echo "Output name bis : "$name1""
	
	if [ "$debug" -eq "1" ]; then
		echo
		echo "${yellow}█████ DEBUG SLEEP (5 sec) █████${reset}"
		echo
		echo "Debug data : autoquit=$autoquit debug=$debug error=$error part=$part noquit=$noquit random=$random"
		sleep 5
		echo
	fi
echo

echo -------------------------========================-------------------------
## The code program.
## Check if an .sha256 file exist and autoload	

exist="$file".sha256""
	if test -f "$exist"; then
	echo "An associated sha256 files exist, autoread"
	#read -r firstline<"$file.sha256"
	sha256file="$file".sha256

else
	echo "OPTIONAL - Associated sha256 file NOT exist, must select OR create (*.sha256 *.txt)"
	sha256file="$(zenity --file-selection --filename=$HOME/$USER --file-filter="*.sha256 *.txt" --title="OPTIONAL - Associated sha256 file NOT exist, must select OR create (*.sha256 *.txt)")"

	echo sha256file = "$sha256file"

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
## If you press cancel on load you will create a new sha256 file

	{
	if test -z "$sha256file"
	then
		echo "You don't have selected a file. You will create a new *.sha256 file."
		echo Press ENTER to continue the creation of a .sha256 file OR press X to quit.
		read name
			cd /"$(dirname "${VAR1}")"
			echo "Your file to check is :"
			echo "$file"
			echo The ckeck sum calculated is :
			sha256sum "$file" | awk '{print $1}' > "${file}.sha256"
			read -r firstline2<"${file}.sha256"
			export VAR3="$file"
			echo Dirname : "$(dirname "${VAR3}")"
			echo Basename : "$(basename "${VAR3}")"
			echo var is a var : "$(dirname "${VAR3}")"
			echo "$firstline2  $(basename "${VAR3}")" > "${file}.sha256"
			echo Is writen : "$firstline2  $(basename "${VAR3}")"
			echo You have created a new file with sum, press ENTER key to continue and compare !
			read name
			sha256file="${file}.sha256"
	else
		echo "An sha256 file is selected and continue (no creation)."
	fi
	}

fi

	echo sha256file = "$sha256file"

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
	# read all lines
	echo "All the lines in the file you provide."
	input="$sha256file"
	while IFS= read -r line
	do
	echo "$line"
	done < "$input"

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
	#put the good line in the variable firstline
	echo Input file : "$file"
	echo "Working dir : "$dir""
	export VAR2="$file"
	echo Base directory : "$(dirname "${VAR2}")"
	echo Base name: "$(basename "${VAR2}")"
	## firstline=`grep "$(basename "${VAR2}")" "$sha256file"`
	##fgrep -F "$(basename "${VAR2}")" "$sha256file" >> firstline
	## grep string filename
	## grep example document.txt
	firstline=$(grep "$(basename "${VAR2}")" $sha256file)
	echo Debug echo, you need 3 variable here.
	echo Var 1 file = "$file"
	echo Var 2 sha256file = "$sha256file"
	echo Var 3 firstline = "$firstline"
	
#watch if sha is include in file you specified
	{
	if test -z "$firstline"
		then
			echo "No matching lines found in file you specified."
			echo Press ENTER to EXIT!
			read name
			exit
		else
			echo "File selected / line matched ; and continue."
			fi
	}

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
#two file have ben provided.

	## DEBUG echo
	#echo file = "$file"
	#echo dirname = "$(dirname "${VAR2}")"
	#echo basename = "$(basename "${VAR2}")"
	#echo "/dev/shm/"$(basename "${VAR2}")".sha256"

	sha256sum "$file" | awk '{print $1}' > "/dev/shm/"$(basename "${VAR2}")".sha256"
	read -r calsum<"/dev/shm/"$(basename "${VAR2}")".sha256"
	echo "Your selected file for hash is : "
	echo "$file"
	echo "The ckeck sum calculated is :"
	echo calsum = "$calsum"
	echo "$calsum $(basename "${VAR2}")" > "/dev/shm/"$(basename  "${VAR2}")".sha256"
	echo "Your selected or auto-load sha256 file is :"
	echo "$sha256file"
	calsum2=""$calsum"  "$(basename "${VAR2}")""
	#echo calsum... = "$calsum"  "$(basename "${VAR2}")"
	echo Visually compare these two lines !
	echo calsum2.. = "$calsum2"
	echo firstline = "$firstline"

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
## Verify if 2 variable is equal	
	
	echo "And the final answer is .... :"
	if [ "$calsum2" = "$firstline" ]; then

	echo "${green}████████████████████████████████████████${reset}"
	echo "${green}██Sha256sum with compare hash is EQUAL██${reset}"
	echo "${green}████████████████████████████████████████${reset}"
	#echo "Sha256sum with compare hash is EQUAL"
	else

	echo "${red}█████████████████████████████████████████████${reset}"	
	echo "${red}██Sha256sum with compare hash ARE NOT equal██${reset}"
	echo "${red}█████████████████████████████████████████████${reset}"
	#echo "Sha256sum with compare hash ARE NOT equal"
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
