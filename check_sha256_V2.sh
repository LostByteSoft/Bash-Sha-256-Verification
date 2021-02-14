echo --- Start of file ---
#!/bin/bash
printf '\033[8;43;132t'		# will resize the window to 132 x 43 characters.
echo -----------------------------------------------------------------------------
echo "Version 2 - sha-256-sum verification, you will select 1 or 2 files"
echo "By LostByteSoft"
echo "Version 2021-02-14"
echo -----------------------------------------------------------------------------

echo "MANDATORY - Select a file to hash (Could be anything)"
file="$(zenity --file-selection --filename=$HOME/$USER --title="MANDATORY - Select a file to hash (Could be anything)")"

# must set the working dir at the location of var FILE
	export VAR1="$FILE"
	#echo "$(dirname "${VAR1}")"
	#echo "$(basename "${VAR1}")"
	#echo var is a var : "$(dirname "${VAR1}")"
	#echo For debug purpose press a key !
	#read name

echo -----------------------------------------------------------------------------

# if exist file then load
# else "no, select a file"
	#shafile="$FILE".sha256
	#if [ -f "$shafile" ];
	#then
	#echo "shafile exists. "$(dirname "${VAR2}")" "
	#else
	#echo "shafile NOT exists"
	#fi
	#echo "$file"
	#echo "$(dirname "${VAR1}")"
	#echo "$(dirname "${VAR2}")"
	#echo "$(dirname "${VAR3}")"
	#echo "shafile = "$shafile""
	#echo For debug purpose press a key !
	#read name

echo -----------------------------------------------------------------------------

echo "OPTIONAL - Select a file with the hash inside (*.sha256)"
sha256file="$(zenity --file-selection --filename=$HOME/$USER --file-filter=*.sha256 --title="OPTIONAL - Select a file with the hash inside (*.sha256)")"

echo -----------------------------------------------------------------------------

	export VAR2="$FILE"
	#echo "$(dirname "${VAR2}")"
	#echo "$(basename "${VAR2}")"
	#echo var is a var : "$(dirname "${VAR2}")"
	#echo sha256file="$sha256file"

if [ "$sha256file" = "" ]; then
	#echo "Only one file was provided."
	export VAR3="$FILE"
	echo -----------------------------------------------------------------------------
	echo "Your file to check is :"
	echo ------------------------
	echo "$FILE"
	echo "The ckeck sum calculated is :"
	sha256sum "$FILE" | awk '{print $1}' > "${FILE}.sha256"
	echo -----------------------------------------------------------------------------
	read -r firstline2<"${FILE}.sha256"
	# if the file exist don't create again
	echo "$firstline2  $(basename "${VAR3}")" > "${FILE}.sha256"
	echo Is writen : "$firstline2  $(basename "${VAR3}")"
	echo -----------------------------------------------------------------------------
	echo You have created a new file with sum, press ENTER key to exit !
	read name
	exit

else
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
	read -r firstline<"$sha256file"
	echo "Your selected sha256 file is : "
	echo "$sha256file"
	echo  -----------------------------------------------------------------------------
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

fi

echo -----------------------------------------------------------------------------

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
