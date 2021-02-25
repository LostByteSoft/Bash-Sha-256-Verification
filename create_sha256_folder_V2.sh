echo --- Start of file ---
#!/bin/bash
printf '\033[8;43;132t'		# will resize the window to 132 x 43 characters.
echo -----------------------------------------------------------------------------
echo "create_sha256_folder_V2"
echo "Create hash sha-256 file for all files in folder specified, multiple hash fileS"
echo "By LostByteSoft"
echo "Version 2021-02-24"
echo -----------------------------------------------------------------------------

	red=`tput setaf 1`
	green=`tput setaf 2`
	reset=`tput sgr0`

echo ${green}Must select the folder you want to make sha fileS.${reset}
echo ${red}!!! Carefull will be created a new sha file for EACH fileS !!!${reset}
echo press ENTER to continue!

echo -----------------------------------------------------------------------------
read name

way="$(zenity --file-selection --title="Choose a directory to hash all file" --filename=$HOME/$USER --directory)"

echo -----------------------------------------------------------------------------

for i in "$way"/*.*;
	do name=`echo "$i" `
	echo name="$name"
	export VAR="$i"
	sha256sum "$name" | awk '{print $1}' > "${name}.sha256"
	read -r firstline<"${name}.sha256"
	echo "$firstline  $(basename "${VAR}")" > "${name}.sha256"
	echo Is writen : "$firstline  $(basename "${VAR}")"
	done

echo -----------------------------------------------------------------------------
echo Finish press ENTER to quit !
echo -----------------------------------------------------------------------------
read name

echo --- End of bash ---
