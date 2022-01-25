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
echo "Sha-256-sum verification, you will select 1 or 2 files"
echo "Version 4"
echo "By LostByteSoft"
echo "Version 2021-03-04"
echo -----------------------------------------------------------------------------

echo "MANDATORY - Select a file to hash (Could be anything)"
file="$(zenity --file-selection --filename=$HOME/$USER --title="MANDATORY - Select a file to hash (Could be anything)")"

	echo file = "$file"
	
{
if test -z "$file"
	then
		echo "You don't have selected a file."
		echo Press ENTER to quit.
		read name
		exit
	else
	echo "File is selected and continue."
fi
}

echo -----------------------------------------------------------------------------

	echo "Directory and file name"
	export VAR2="$file"
	echo dirname = "$(dirname "${VAR2}")"
	echo basename = "$(basename "${VAR2}")"
	
echo -----------------------------------------------------------------------------

exist="$file".sha512""
	if test -f "$exist"; then
	echo "An associated sha512 files exist, autoread"
	#read -r firstline<"$file.sha512"
	sha512file="$file".sha512

else
	echo "OPTIONAL - Associated sha512 file NOT exist, must select OR create (*.sha512 *.txt)"
sha512file="$(zenity --file-selection --filename=$HOME/$USER --file-filter="*.sha512 *.txt" --title="OPTIONAL - Associated sha512 file NOT exist, must select OR create (*.sha512 *.txt)")"

	echo sha512file = "$sha512file"

echo -----------------------------------------------------------------------------

{
if test -z "$sha512file"
	then
		echo "You don't have selected a file. You will create a new *.sha512 file."
		echo Press ENTER to continue the creation of a .sha512 file OR press X to quit.
		read name
			cd /"$(dirname "${VAR1}")"
			echo -----------------------------------------------------------------------------
			echo "Your file to check is :"
			echo "$file"
			echo ------------------------
			echo The ckeck sum calculated is :
			sha512sum "$file" | awk '{print $1}' > "${file}.sha512"
			echo -----------------------------------------------------------------------------
			read -r firstline2<"${file}.sha512"
			export VAR3="$file"
			#echo "$(dirname "${VAR3}")"
			#echo "$(basename "${VAR3}")"
			#echo var is a var : "$(dirname "${VAR3}")"
			echo "$firstline2  $(basename "${VAR3}")" > "${file}.sha512"
			echo Is writen : "$firstline2  $(basename "${VAR3}")"
			echo -----------------------------------------------------------------------------
			echo You have created a new file with sum, press ENTER key to continue and compare !
			read name
			sha512file="${file}.sha512"
	else
	echo "An sha512 file is selected and continue (no creation)."
fi
}

fi

echo -----------------------------------------------------------------------------


	# read all lines
	echo "All the lines in the file you provide."
	input="$sha512file"
	while IFS= read -r line
	do
	echo "$line"
	done < "$input"

echo -----------------------------------------------------------------------------

	#put the good line in the variable firstline
	firstline="`grep "$(basename "${VAR2}")" "$sha512file"`"

	echo Debug echo, you need 3 variable here.
	echo Var 1 file = "$file"
	echo Var 2 sha512file = "$sha512file"
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

	echo -----------------------------------------------------------------------------

	#two file have ben provided.
	export VAR2="$file"
	#echo dirname = "$(dirname "${VAR2}")"
	#echo basename = "$(basename "${VAR2}")"
	sha512sum "$file" | awk '{print $1}' > "/dev/shm/"$(basename "${VAR2}")".sha512"
	read -r calsum<"/dev/shm/"$(basename "${VAR2}")".sha512"
	echo "Your selected file for hash is : "
	echo $file
	echo "The ckeck sum calculated is :"
	echo calsum = "$calsum"
	echo "$calsum $(basename "${VAR2}")" > "/dev/shm/"$(basename  "${VAR2}")".sha512"
	echo ------------------------
	echo "Your selected sha512 file is : (Only if you have selected one) "
	echo "$sha512file"
	echo -----------------------------------------------------------------------------
	calsum2=""$calsum"  "$(basename "${VAR2}")""
	#echo calsum... = "$calsum"  "$(basename "${VAR2}")"
	echo Visually compare these two lines !
	echo calsum2.. = "$calsum2"
	echo firstline = "$firstline"
	echo -----------------------------------------------------------------------------
	
	red=`tput setaf 1`
	green=`tput setaf 2`
	reset=`tput sgr0`
	#echo "${red}red text ${green}green text${reset}"
	
	echo "And the final answer is .... :"
	if [ "$calsum2" = "$firstline" ]; then

	echo "${green}sha512sum with compare hash is EQUAL${reset}"
	#echo "sha512sum with compare hash is EQUAL"
	else
	
	echo "${red}sha512sum with compare hash ARE NOT equal${reset}"
	#echo "sha512sum with compare hash ARE NOT equal"
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
