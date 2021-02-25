echo --- Start of file ---
#!/bin/bash
printf '\033[8;20;80t'		# will resize the window to 132 x 43 characters.
echo -----------------------------------------------------------------------------
echo "create_sha256_folder_V1"
echo "Create hash sha-256 file for all files in folder, multiple hash fileS"
echo "By LostByteSoft"
echo "Version 2021-02-24"
echo -----------------------------------------------------------------------------

	red=`tput setaf 1`
	green=`tput setaf 2`
	reset=`tput sgr0`

echo ${green}Must be placed in the folder you want to make sha fileS.${reset}
echo ${red}!!! Carefull will be created a new sha file for EACH fileS !!!${reset}
echo press ENTER to continue!

echo -----------------------------------------------------------------------------
read name

	for i in *.*;
	do name=`echo "$i" | cut -f1`
	echo "$name"
	sha256sum "$name" | awk '{print $i}' > "${name}.sha256"
	done

echo -----------------------------------------------------------------------------
echo Finish press ENTER to quit !
echo -----------------------------------------------------------------------------
read name

echo --- End of bash ---
