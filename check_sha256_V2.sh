echo --- Start of file ---
#!/bin/bash
printf '\033[8;43;132t'		# will resize the window to 132 x 43 characters.
echo -----------------------------------------------------------------------------
echo "Sha-256-sum verification, you will select 1 or 2 files"
echo "Version 2"
echo "By LostByteSoft"
echo "Version 2021-02-14"
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

	#echo "$firstline" | tr [:upper:] [:lower:]
	#echo "$firstline"
	#echo Press ENTER 02!
	#read name
	
else
	echo "NOT exist, must select"
echo "OPTIONAL - Select a file with the hash inside (*.sha256 *.txt)"
sha256file="$(zenity --file-selection --filename=$HOME/$USER --file-filter="*.sha256 *.txt" --title="OPTIONAL - Select a file with the hash inside (*.sha256 *.txt)")"

	read -r firstline<"$sha256file"
	
	#echo "$firstline"
	#echo "$firstline^l"
	#echo Press ENTER 02!
	#read name

fi
	# Debug echo
	#echo file="$file"
	#echo firstline="$firstline"
	#echo sha256file="$sha256file"

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

	echo -----------------------------------------------------------------------------
	echo Press ENTER key to exit !
	read name
	exit

echo -----------------------------------------------------------------------------
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

# --- End of file ---
