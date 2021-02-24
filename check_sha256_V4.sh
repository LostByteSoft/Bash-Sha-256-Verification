echo --- Start of file ---
#!/bin/bash
printf '\033[8;43;132t'		# will resize the window to 132 x 43 characters.
echo -----------------------------------------------------------------------------
echo "Sha-256-sum verification, you will select 1 or 2 files"
echo "Version 4"
echo "By LostByteSoft"
echo "Version 2021-02-24"
echo -----------------------------------------------------------------------------

echo "MANDATORY - Select a file to hash (Could be anything)"
file="$(zenity --file-selection --filename=$HOME/$USER --title="MANDATORY - Select a file to hash (Could be anything)")"

	echo file = "$file"

echo -----------------------------------------------------------------------------

	echo "Directory and file name"
	export VAR2="$file"
	echo dirname = "$(dirname "${VAR2}")"
	echo basename = "$(basename "${VAR2}")"
	
echo -----------------------------------------------------------------------------

exist="$file".sha256""
	if test -f "$exist"; then
	echo "exist, autoread"
	#read -r firstline<"$file.sha256"

else
	echo "OPTIONAL - Associated sha256 file NOT exist, must select OR create (*.sha256 *.txt)"
sha256file="$(zenity --file-selection --filename=$HOME/$USER --file-filter="*.sha256 *.txt" --title="OPTIONAL - Associated sha256 file NOT exist, must select OR create (*.sha256 *.txt)")"

	echo sha256file = "$sha256file"

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
	echo "An sha256 file is selected and continue"
fi
}

echo -----------------------------------------------------------------------------

	# read all lines
	echo "All the lines in the file you provide."
	input="$sha256file"
	while IFS= read -r line
	do
	echo "$line"
	done < "$input"

echo -----------------------------------------------------------------------------

	#put the good line in the variable firstline
	firstline="`grep "$(basename "${VAR2}")" "$sha256file"`"

fi

	echo Debug echo, you need 3 variable here.
	echo file="$file"
	echo sha256file="$sha256file"
	echo firstline="$firstline"
	#echo Press ENTER !
	#read name
	
	#watch if sha is include in file you specified
	{
	if test -z "$firstline"
		then
			echo "No matching lines found in file you specified."
			echo Press ENTER to continue!
			read name
		else
			echo "File selected and continue."
			fi
	}

echo -----------------------------------------------------------------------------

	#two file have ben provided.
	export VAR2="$file"
	#echo dirname = "$(dirname "${VAR2}")"
	#echo basename = "$(basename "${VAR2}")"
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
	echo Visually compare these two lines !
	echo calsum2.. = "$calsum2"
	echo firstline = "$firstline"
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
