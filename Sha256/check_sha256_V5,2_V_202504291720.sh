#!/bin/bash
#!/usr/bin/ffmpeg

	printf '\033[8;20;105t'		# will resize the window.

echo -------------------------===== Start of bash ====-------------------------

	start=$SECONDS
	now=$(date +"%Y-%m-%d_%A_%H:%M:%S")	## time now
	id=$(echo $PPID)			## current process id of the bash process

	red=`tput setaf 1`
	green=`tput setaf 2`
	yellow=`tput setaf 11`
	blue=`tput setaf 12`
	reset=`tput sgr0`

	## General purposes variables. Needed before program to random variables.
	## All variables must be 0
	part=0		## Don't change this value.
	primeerror=0	## Ending error detector, do not change.
	error=0		## Test error, do not change.
	
	## All variables must be 0 or 1
	automatic=0	## automatic without (at least minimal) dialog box. (0 or 1)
	debug=0		## test debug. (0 or 1 debug mode)
	noquit=0	## noquit option. (0 or 1)
	lowercase=0	## Change all to lowercase option. (0 or 1)

	## Auto-generated variables. Do not change
	random=$(shuf -i 4096-131072 -n 1)	# Used for temp folders. A big number hard to guess for security reasons.
	random2=$RANDOM

	echo
	printf '\u2500\u252c\u2500\nLost%sByte%sSoft\n\u2500\u2534\u2500\n'
	echo
	sleep 0.5
	echo
	echo "Software lead-in. LostByteSoft ; https://github.com/LostByteSoft"
	echo
	echo "NEVER remove dual ## in front of lines. Theses are code annotations."
	echo "You can test / remove single # for testing purpose."
	echo
	echo "Current time : $now"
	echo
	echo "Common variables, you can changes theses variables as you wish to test."
	echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2"
	echo "		primeerror=$primeerror lowercase=$lowercase id=$id"
	me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
	echo
	echo "Running job file : $me"
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Specific softwares variables, you can change theses variables.
	echo
	echo automatic=0 , 0 or 1 , 0 deactivated , 1 activated
	automatic=0
	echo noquit=1 , 0 or 1 , 0 deactivated , 1 activated
	noquit=1
	echo
	hashtype=sha256
	echo
	echo "Read me for this file (and known bugs) :"
	echo
	echo "This software could use theses softwares:"
	echo
	echo "Use ffmpeg https://ffmpeg.org/ffmpeg.html"
	echo "Use ImageMagik https://imagemagick.org/index.php"
	echo "Use Gnu Parallel https://www.gnu.org/software/parallel/"
	echo
	echo "Options https://trac.ffmpeg.org/wiki/Encode/H.264"
	echo "4k demo HDR https://www.demolandia.net"
	echo
	echo "Informations : (EULA at the end of file, open in text.)"
	echo "By LostByteSoft, no copyright or copyleft. https://github.com/LostByteSoft"
	echo
	echo "Don't hack paid software, free software exists and does the job better."
	echo

echo -------------------------========================-------------------------
	echo Version compiled on : Also serves as a version
	echo 2025-04-29_Tuesday_17:20:48
echo -------------------------========================-------------------------
echo "Color codes / Informations."
	echo
	echo  "${green}	████████████████     ALL OK / ACTIVE      ████████████████ ${reset}"
	echo   "${blue}	████████████████      INFORMATION(S)      ████████████████ ${reset}"
	echo "${yellow}	████████████████   ATTENTION / INACTIVE   ████████████████ ${reset}"
	echo    "${red}	████████████████   FATAL ERROR / OFFLINE  ████████████████ ${reset}"
	echo

echo -------------------------========================-------------------------
echo "Functions informations. Version 1,10"
	echo

##-------------------------=========== SEPARATOR =============-------------------------

	name=AUTOMATIC
	explain="The lowest possible questions/pause."
	if [ "$automatic" -eq "0" ]; then
		echo 	"Function ${green}█████${reset} Default deactivated $name . $explain"
	else
		echo 	"Function ${blue}█████${reset} Activated $name . $explain"
	fi
	echo

##-------------------------=========== SEPARATOR =============-------------------------

	name=DEBUG
	explain="Slow down execution with informations."
	if [ "$debug" -eq "0" ]; then
		echo 	"Function ${green}█████${reset} Default deactivated $name . $explain"
	else
		echo 	"Function ${blue}█████${reset} Activated $name . $explain"
	fi
	echo

	debug() {
		echo
		echo "Debug data : debug=$debug debugcore=$debugcore error=$error part=$part noquit=$noquit"
		echo "random=$random random2=$random2 automatic=$automatic primeerror=$primeerror id=$id"
		echo
		}

##-------------------------=========== SEPARATOR =============-------------------------

	name=ERROR
	explain="Errorlevel show error messages."
	if [ "$error" -eq "0" ]; then
		echo 	"Function ${green}█████${reset} Default deactivated $name . $explain"
	else
		echo 	"Function ${blue}█████${reset} Activated $name . $explain"
	fi
	echo

	error() {
		if [ "$?" -ge 1 ]; then
			noquit=1
			automatic=0
			primeerror=$((primeerror+1))
			echo
			echo "${red}█████████████████████████████████ ERROR SECTION $part █████████████████████████████████${reset}"
			debug
			echo "!!! ERROR was detected !!!" ## Press ANY key to try to CONTINUE !!!
			echo
			sleep 1
		else
			echo
			echo "${green} █████████ No error found. █████████ ${reset}"
			echo
			fi
		}

##-------------------------=========== SEPARATOR =============-------------------------

	name=NOQUIT
	explain="Do not quit at the end of the program."
	if [ "$noquit" -eq "0" ]; then
		echo 	"Function ${blue}█████${reset} Default deactivated $name . $explain"
	else
		echo 	"Function ${green}█████${reset} Activated $name . $explain"
	fi
	echo

##-------------------------=========== SEPARATOR =============-------------------------
## Simple function small bar to wait 3 sec. This bar does work with debian 12 & 13. Version 1.05

	functionsmallbar() {
		speed=0.2
		if [ "$debug" -eq 0 ]; then
			echo -ne ${yellow}'	TimeToQuit |                        |    (0%)\r'${reset}
			sleep $speed
			echo -ne ${yellow}'	TimeToQuit |  ██                    |   (10%)\r'${reset}
			sleep $speed
			echo -ne ${yellow}'	TimeToQuit |  ████                  |   (20%)\r'${reset}
			sleep $speed
			echo -ne ${yellow}'	TimeToQuit |  ██████                |   (30%)\r'${reset}
			sleep $speed
			echo -ne ${yellow}'	TimeToQuit |  ████████              |   (40%)\r'${reset}
			sleep $speed
			echo -ne ${yellow}'	TimeToQuit |  ██████████            |   (50%)\r'${reset}
			sleep $speed
			echo -ne ${yellow}'	TimeToQuit |  ████████████          |   (60%)\r'${reset}
			sleep $speed
			echo -ne ${yellow}'	TimeToQuit |  ██████████████        |   (70%)\r'${reset}
			sleep $speed
			echo -ne ${yellow}'	TimeToQuit |  ████████████████      |   (80%)\r'${reset}
			sleep $speed
			echo -ne ${yellow}'	TimeToQuit |  ██████████████████    |   (90%)\r'${reset}
			sleep $speed
			echo -ne ${yellow}'	TimeToQuit |  ████████████████████  |  (100%)\r'${reset}
			sleep $speed
			echo -ne '\n'
		else
			echo ${yellow} ████████████████████ DEBUG BYPASS functionfastbar ████████████████████${reset}
			sleep $speed
		fi
		}

## -------------------------===== Separator =====-------------------------
echo -------------------------========================-------------------------
echo "Select folder or filename using dialog !"
	echo

	file="$(zenity --file-selection --filename=$HOME/ --title="Select a file, all format supported")"	## File select.
	## file=$(zenity  --file-selection --filename=$HOME/ --title="Choose a directory to convert all file" --directory)	## Directory select.
	## file="/$HOME/Pictures/"
	## file="/$HOME/Downloads/"
	## --file-filter="*.jpg *.gif *.jpeg"
	## --file-filter='**[WwEeBbPp] | *[JjPpGg]' 

	count=`ls -1 "$file" 2>/dev/null | wc -l`
	if [ $count -ge "1" ]; then
		echo Count : $count
		echo
		echo "You have selected :"
		echo "$file"
		echo
		fi

## -------------------------===== Separator =====-------------------------

### file or folder
	if test -z "$file"	## for cancel on zenity
		then
			echo "You click CANCEL !"
			echo
			echo "${yellow}█████████████████████ NO DATA TO PROCESS █████████████████████${reset}"
			echo
			read -n 1 -s -r -p "Press any key to EXIT"
			echo
			exit
		fi

	if [ "$count" -eq 0 ]	## for n files in directory
		then
			echo "You don't have selected a folder including files !"
			echo
			echo "${yellow}█████████████████████ NO DATA TO PROCESS █████████████████████${reset}"
			echo
			read -n 1 -s -r -p "Press any key to EXIT"
			echo
			exit
		fi
	
echo -------------------------========================-------------------------
## Input_Directory_Output
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
	echo

## Debug data
	echo "Debug data : autoquit=$autoquit debug=$debug error=$error part=$part noquit=$noquit random=$random"
	echo

echo -------------------------========================-------------------------
echo "The core/code program. Check sha256. Version 5.23"
	echo
	debugsha256=0
	
	#rm "/dev/shm/temp.sha256" 2> /dev/null
	
	debugsha256() {
		if [ "$debugsha256" -eq "1" ]; then
			read -n 1 -s -r -p "Press ENTER key to continue !"
			echo
			fi
			}	## end function
		
exist="$file".sha256""
if test -f "$exist"; then
	echo "An associated sha256 files exist, autoread"
	#read -r firstline<"$file.sha256"
	sha256file="$file".sha256

else
	echo "OPTIONAL - Associated sha256 file NOT exist, must select OR press CANCEL to create a file."
	sha256file="$(zenity --file-selection --filename=$HOME/$USER --file-filter="*.sha256 *.txt" --title="OPTIONAL - Associated sha256 file NOT exist, must select OR create (*.sha256 *.txt)")"

	echo
	echo sha256file = "$sha256file"
	echo

	debugsha256

echo
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
## If you press cancel on load you will create a new sha256 file

	{
	if test -z "$sha256file"
	then
		echo "You don't have selected a file. You will create a new *.sha256 file."
		sleep 1
		#echo Press ENTER to continue the creation of a .sha256 file OR press X to quit.
		#read name
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
			echo
			echo Is writen : "$firstline2  $(basename "${VAR3}")"
			#echo You have created a new file with sum, press ENTER key to continue and compare !
			#read name
			sleep 1
			sha256file="${file}.sha256"
	else
		echo "An sha256 file is selected and continue (no creation)."
	fi
	}

fi
	
	#echo
	#echo sha256file = "$sha256file"
	#echo
	
	debugsha256

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "All the lines in the file you have provided or created."
	echo

	input="$sha256file"
	while IFS= read -r line
	do
	echo "$line"
	done < "$input"
	
	debugsha256

echo
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
#put the good line in the variable firstline
	echo Input file : "$file"
	echo "Working dir : "$dir""
	export VAR2="$file"
	echo Base directory : "$(dirname "${VAR2}")"
	echo Base name: "$(basename "${VAR2}")"
	
	#firstline=`grep ""$(basename "${VAR2}")"" "$sha256file"`
	##fgrep -F "$(basename "${VAR2}")" "$sha256file" >> firstline
	## grep string filename
	## grep example document.txt
	echo
	echo basename = ""$(basename "${VAR2}")""
	echo sha256file = "$sha256file"
	firstline=$(grep """$(basename "${VAR2}")""" "$sha256file")
	#echo Debug echo, you need 3 variable here.
	echo
	echo Var 1 file = "$file"
	echo Var 2 sha256file = "$sha256file"
	echo Var 3 firstline = "$firstline"
	
#watch if sha is include in file you specified
	{
	if test -z "$firstline"
		then
			echo
			echo "No matching lines found in file you specified."
			echo Press ENTER to EXIT!
			read name
			exit
		else
			echo
			echo "File selected / line matched ; and continue."
			fi
	}
	
	debugsha256

echo
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
#two file have ben provided.
echo "!!! WAIT !!! Calculations started. If you press cancel on load you will create a new sha256 file."

	## DEBUG echo
	#echo file = "$file"
	#echo dirname = "$(dirname "${VAR2}")"
	#echo basename = "$(basename "${VAR2}")"
	#echo "/dev/shm/"$(basename "${VAR2}")".sha256"

	sha256sum "$file" | awk '{print $1}' > "/dev/shm/""$(basename "${VAR2}")"".sha256"
	read -r calsum<"/dev/shm/""$(basename "${VAR2}")"".sha256"
	echo "Your selected file for hash is : "
	echo "$file"
	echo "The ckeck sum calculated is :"
	echo
	echo calsum = "$calsum"
	echo "$calsum "$(basename "${VAR2}")"" > "/dev/shm/""$(basename  "${VAR2}")"".sha256"
	echo
	echo "Your selected or auto-load sha256 file is :"
	echo "$sha256file"
	calsum2=""$calsum"  ""$(basename "${VAR2}")"""
	#echo calsum... = "$calsum"  "$(basename "${VAR2}")"
	echo
	echo Visually compare these two lines !
	echo calsum2.. = "$calsum2"
	echo firstline = "$firstline"
	
	debugsha256

echo
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
## Verify if 2 variable is equal	
	echo "And the final answer is .... :"

	if [ "$calsum2" = "$firstline" ]; then
			echo
			echo "		${green}█████████████████████████████████████████████████████████████${reset}"
			echo "		${green}██                                                         ██${reset}"
			echo "		${green}██         Sha256sum with compare hash is EQUAL            ██${reset}"
			echo "		${green}██                                                         ██${reset}"
			echo "		${green}█████████████████████████████████████████████████████████████${reset}"
			#echo "Sha256sum with compare hash is EQUAL"
		else
			echo
			echo "		${yellow}███████████████████████████████████████████████████████████████████${reset}"
			echo "		${yellow}██                                                               ██${reset}"
			echo "		${yellow}██          ha256sum with compare hash ARE NOT equal             ██${reset}"
			echo "		${yellow}██                                                               ██${reset}"
			echo "		${yellow}███████████████████████████████████████████████████████████████████${reset}"
			#echo "Sha256sum with compare hash ARE NOT equal"
		fi
	
	debugsha256

	#rm "/dev/shm/temp.sha256" 2> /dev/null

echo
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Software lead out. Version 5.12"
	echo
	echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random"
	echo "		random2=$random2 automatic=$automatic primeerror=$primeerror id=$id"
	echo
	echo "Finish... with numbers of actions : $part"
	echo "This script take $(( SECONDS - start )) seconds to complete."
	date=$(date -d@$(( SECONDS - start )) -u +%H:%M:%S)
	echo "Time needed: $date"
	now=$(date +"%Y-%m-%d_%A_%I:%M:%S")
	echo "Current time : $now"
	echo
	echo " " >>/dev/shm/logs.txt
	echo "$now (Time now)" >>/dev/shm/logs.txt
	echo "	Time needed : $date" >>/dev/shm/logs.txt
	echo "	Name of software : $me" >>/dev/shm/logs.txt
	echo "	Debug data : debug=$debug debugcore=$debugcore error=$error part=$part noquit=$noquit random=$random random2=$random2 automatic=$automatic primeerror=$primeerror id=$id" >>/dev/shm/logs.txt
	echo "	File (If any used) : $file" >>/dev/shm/logs.txt
	echo " " >>/dev/shm/logs.txt
	echo "--------------------====== SEPARATOR ========--------------------" >>/dev/shm/logs.txt

echo -------------------------===== End of Bash ======-------------------------
## Exit, wait or auto-quit.

	if [ "$primeerror" -ge "1" ]; then
		printf '\033[8;23;88t'		## Will resize the window.
		echo
		echo "	${red}████████████████████████████████████████████${reset}"
		echo "	${red}██                                        ██${reset}"
		echo "	${red}██     Unknown entry event... ERROR(S)    ██${reset}"
		echo "	${red}██                                        ██${reset}"
		echo "	${red}████████████████████████████████████████████${reset}"
		echo
		echo "Numbers of error(s) : $primeerror"
		echo
		echo "RUNNING : $me"
		debug
		#functionsmallbar
		noquit=1
	else
		printf '\033[8;19;88t'		## Will resize the window.
		echo
		echo "${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo "${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "${green}██         NO errors detected.        ██${reset}	${blue}██       Time needed : $date       ██${reset}"
		echo "${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo
		echo "RUNNING : $me"
	fi

	if [ "$noquit" -eq "1" ]; then
		echo
		echo "${blue}	█████████████████ NO exit activated ███████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to exit !"
		echo
		fi

	if [ "$debug" -eq "1" ]; then
		debug
		echo "${blue}		█████ DEBUG WAIT | Program finish. █████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue !"
		echo
		fi

	echo
	echo "${green}	███████████████ Finish, quit in 3 seconds █████████████████${reset}"
	echo
	functionsmallbar
	echo
	sleep 0.5
	exit 0

## -----===== Start of eula =====-----

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
