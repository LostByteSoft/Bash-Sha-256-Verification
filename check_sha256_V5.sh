#!/bin/bash
#!/usr/bin/ffmpeg
## -----===== Start of bash =====-----
	#printf '\033[8;50;75t'		# will resize the window, if needed.
	printf '\033[8;40;140t'	# will resize the window, if needed.
echo -------------------------========================-------------------------
## Software lead in
	start=$SECONDS
	now=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now"
echo -------------------------========================-------------------------
## Software name, what is this, version, informations.
	echo "check_sha256_V5"
echo -------------------------========================-------------------------
	echo What it does ?
	echo "Sha-256-sum verification, you will select 1 or 2 files"
echo -------------------------========================-------------------------
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
echo -------------------------========================-------------------------
	echo Version compiled on : Also serves as a version
	echo 2022-01-24_Monday_06:11:34
echo -------------------------========================-------------------------
echo "Select filename using dialog !"

	file="$(zenity --file-selection --filename=$HOME/$USER --title="Select a file, all format supported")"

if test -z "$file"
	then
		echo "You don't have selected a file, now exit."
		echo Press ENTER to exit !
		echo -------------------------========================-------------------------
		read name
		exit
	else
		echo "You have selected :"
		echo "$file"
fi
echo -------------------------========================-------------------------
echo "Input name, directory and output name :"

	## Set working path.
	dir=$(pwd)
	
	echo Input file : "$file"
	
	echo "Working dir : "$dir""
	export VAR2="$file"
	echo Base directory : "$(dirname "${VAR2}")"
	echo Base name: "$(basename "${VAR2}")"
	
	## Output file name
	name=`echo "$file" | rev | cut -f 2- -d '.' | rev` ## remove extension
	echo "Output file : "$name""
echo -------------------------========================-------------------------
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

	echo -------------------------========================-------------------------
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

echo sha256file = $sha256file

echo -------------------------========================-------------------------
# read all lines
	echo "All the lines in the file you provide."
	input="$sha256file"
	while IFS= read -r line
	do
	echo "$line"
	done < "$input"

echo -------------------------========================-------------------------
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
	
	echo Press ENTER to continue!
	read name
	
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

echo -------------------------========================-------------------------
#two file have ben provided.

	## DEBUG echo
	#echo file = "$file"
	#echo dirname = "$(dirname "${VAR2}")"
	#echo basename = "$(basename "${VAR2}")"
	#echo "/dev/shm/"$(basename "${VAR2}")".sha256"

	sha256sum "$file" | awk '{print $1}' > "/dev/shm/"$(basename "${VAR2}")".sha256"
	read -r calsum<"/dev/shm/"$(basename "${VAR2}")".sha256"
	echo "Your selected file for hash is : "
	echo $file
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

echo -------------------------========================-------------------------
## Verify if 2 variable is equal	
	
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
