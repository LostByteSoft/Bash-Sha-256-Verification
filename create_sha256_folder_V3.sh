echo --- Start of file ---
#!/bin/bash
printf '\033[8;43;132t'		# will resize the window to 132 x 43 characters.
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

echo -----------------------------------------------------------------------------
echo Finish press ENTER to quit !
echo -----------------------------------------------------------------------------
read name
exit
echo --- End of bash ---

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                        Version 3.1415926535
                          February 2022

	  As is customary and in compliance with current global and
	interplanetary regulations, the author of these pages disclaims
	all liability for the consequences of the advice given here,
	in particular in the event of partial or total destruction of
	the material, Loss of rights to the manufacturer warranty,
	electrocution, drowning, divorce, civil war, the effects of
	radiation due to atomic fission, unexpected tax recalls or
	    encounters with extraterrestrial beings elsewhere.

      LostByteSoft no copyright or copyleft we are in the center.

# --- End of file ---

