#!/bin/bash
#!/usr/bin/ffmpeg

	printf '\033[8;35;90t'	## minimum of 88 for graphics.
	version=2025-05-05_Monday_19:51:53
	hashtype=md5

echo -------------------------===== Start of bash ====-------------------------
	## Time, host name, file name, pid.
		start=$SECONDS
		now=$(date +"%Y-%m-%d_%A_%H:%M:%S")	## time now
		hostname=$(cat /etc/hostname)
		#hostname="${hostname%-pc}"
		me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
		id=$(echo $PPID)			## current process id of the bash process
	## General purposes variables. Needed before program to random variables.
	## All general variables must be 0, DO NOT CHANGE.
		part=0		## Don't change this value.
		primeerror=0	## Ending error detector, do not change.
		error=0		## Test error, do not change.
	## Auto-generated variables. DO NOT CHANGE.
		random=$(shuf -i 4096-131072 -n 1)	# Used for temp folders. A big number hard to guess for security reasons.
		random2=$RANDOM
	## All general variables must be 0 or 1
		automatic=0	## automatic without (at least minimal) dialog box. (0 or 1)
		debug=0		## test debug. (0 or 1 debug mode)
		noquit=0	## noquit option. (0 or 1)
		lowercase=0	## Change all to lowercase option. (0 or 1)
		reseize=1	## Reseize windows option. (0 or 1)
	## Colors codes
		red=$(tput setaf 1)
		green=$(tput setaf 2)
		yellow=$(tput setaf 11)
		blue=$(tput setaf 12)
		orange=$(tput setaf 9)
		reset=$(tput sgr0)

##-------------------------=========== SEPARATOR =============-------------------------
	echo
	echo "${yellow}  ░▒▓█▓▒░      ░▒▓██████▓▒░ ░▒▓███████▓▒░▒▓████████▓▒░ "
	echo "${yellow}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${yellow}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${yellow}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░   ░▒▓█▓▒░     "
	echo "${yellow}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░     "
	echo "${yellow}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░     "
	echo "${yellow}  ░▒▓████████▓▒░▒▓██████▓▒░░▒▓███████▓▒░   ░▒▓█▓▒░     ${reset}"
	echo
	echo "${green}	  ░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓████████▓▒░ "
	echo "${green}	  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░        "
	echo "${green}	  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░        "
	echo "${green}	  ░▒▓███████▓▒░ ░▒▓██████▓▒░   ░▒▓█▓▒░   ░▒▓██████▓▒░   "
	echo "${green}	  ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░        "
	echo "${green}	  ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░        "
	echo "${green}	  ░▒▓███████▓▒░   ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓████████▓▒░ ${reset}"
	echo
	echo "${yellow}		   ░▒▓███████▓▒░░▒▓██████▓▒░░▒▓████████▓▒░▒▓████████▓▒░ "
	echo "${yellow}		  ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${yellow}		  ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${yellow}		   ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░    ░▒▓█▓▒░     "
	echo "${yellow}			 ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${yellow}			 ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${yellow}		  ░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░         ░▒▓█▓▒░  ${reset}"
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
	sleep 0.5
	echo "Software lead-in. LostByteSoft ; https://github.com/LostByteSoft"
	echo
	echo "NEVER remove dual ## in front of lines. Theses are code annotations."
	echo "You can test / remove single # for testing purpose."
	echo
	echo "Current time : $now"
	echo
	echo "Common variables, you can changes theses variables as you wish to test."
	echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2"
	echo "		primeerror=$primeerror lowercase=$lowercase id=$id reseize=$reseize"
	echo
	echo "You are running this script from : $hostname"
	echo
	echo "Running software file : $(dirname "$0")/"
	echo
	echo "Running job file : $me"
	echo
	echo "Version : $version"
	echo
	echo "Read me for this file : (EULA at the end of file, open in text.)"
	echo
	echo "By LostByteSoft, no copyright or copyleft. https://github.com/LostByteSoft"
	echo
	echo "Don't hack paid software, free software exists and does the job better."
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo Specific softwares variables, you can change theses variables.
	echo
	echo "0 or 1 , 0 deactivated , 1 activated"
	echo
	findsubfolders=0
	echo findsubfolders=$findsubfolders
	lowercases=0
	echo lowercase=$lowercase
	detox=0
	echo detox=$detox
	automatic=1
	echo automatic=$automatic
	debug=0
	echo debug=$debug , default 0
	minimize=0
	echo minimize=$minimize , default 0
	maximize=0
	echo maximize=$maximize , default 0
	resize=1
	echo resize=$resize , default 1
	noquit=1
	echo noquit=$noquit , default 0
	echo
echo -------------------------========================-------------------------
echo "Color codes / Informations."
	echo
	echo  "${green}	████████████████     ALL OK / ACTIVE      ████████████████ ${reset}"
	echo   "${blue}	████████████████      INFORMATION(S)      ████████████████ ${reset}"
	echo "${yellow}	████████████████   ATTENTION / INACTIVE   ████████████████ ${reset}"
	echo    "${red}	████████████████   FATAL ERROR / OFFLINE  ████████████████ ${reset}"
	echo

echo -------------------------========================-------------------------
echo "Functions informations. Version 1,12"
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
		echo "${green}███████████████████████ DEBUG RUNNING ███████████████████████${reset}"
		echo
		echo "Debug data : debug=$debug debugcore=$debugcoreerror=$error part=$part noquit=$noquit automatic=$automatic primeerror=$primeerror"
		echo "		random=$random random2=$random2 id=$id automatic=$automatic reseize=$reseize debugcore=$debugcore"
		echo
		reseize=0
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
			reseize=0
			noquit=1
			automatic=0
			primeerror=$((primeerror+1))
			echo
			echo "${red}█████████████████████████████████ ERROR SECTION $part █████████████████████████████████${reset}"
			debug
			echo "!!! ERROR was detected !!!" ## Press ANY key to try to CONTINUE !!!
			echo
			printf '\033[8;45;90t'		## Will resize the window.
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
## Simple function sleep bar to wait. Wait the time you specified in code.
	## Version 1.26
	## https://github.com/LostByteSoft
	## LostBytesSoft, lost byte softwares, because everything is ephemeral.
	## Replace the nothing show sleep with a better looking bar.
	## SPECIFY A SLEEP TIME IN SECONDS BEFORE FUNCTION IN CODE. Default sleep is 3 second if not specified.

	## In code exemple:
	## sleep=3		## Use minimum 1 as a vriable.
	## functionsleepbar

	## Local var.
	sleep=3
	sleep1=0
	sleep2=0

functionsleepbar() {

	if [ "$sleep" -ge "1" ]; then
			sleep1=$(echo "scale=2 ; "$sleep"/20" | bc)
			sleep2=$(echo "scale=2 ; "$sleep"/10" | bc)
		else
			sleep=3
			sleep1=$(echo "scale=2 ; "$sleep"/20" | bc)
			sleep2=$(echo "scale=2 ; "$sleep"/10" | bc)
		fi

	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|	|	|	|	|	|        (0%)\r"${reset}
	sleep "$sleep2"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|██	|	|	|	|	|        (5%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|█████	|	|	|	|	|	(10%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|	|	|	|	|	(15%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|█	|	|	|	|	(20%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███	|	|	|	|	(25%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|█████	|	|	|	|	(30%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|	|	|	|	(35%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|█	|	|	|	(40%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███	|	|	|	(45%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|█████	|	|	|	(50%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|	|	|	(55%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|█	|	|	(60%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|███	|	|	(65%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|█████	|	|	(70%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|███████|	|	(75%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|███████|█	|	(80%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|███████|███	|	(90%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|███████|█████	|	(95%)\r"${reset}
	sleep "$sleep1"
	echo -ne ${green}"Sleep time $sleep sec. ${green}	|███████|███████|███████|███████|███████|      (100%)\r"${reset}
	sleep "$sleep1"
	echo -ne '\n'
	sleep=0
	sleep1=0
	sleep2=0
	}

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
echo "The core/code program. Check ${hashtype}sum. Version 5.317"
	echo
	debugcore=0
	readdata=0
	calsum1=
	calsum2=
	calsum3=0

## -------------------------===== Separator =====-------------------------

	if [ "$debugcore" -eq "1" ]; then
		printf '\033[8;40;100t'		# will resize the window.
		fi

	debugcore() {
		if [ "$debugcore" -eq "1" ]; then
			echo -------------------------===== Separator =====-------------------------
			echo
			echo Read data $readdata
			echo
			echo hashsum = ${hashtype}sum
			echo
			echo hashtypefile = $hashtypefile
			echo
			echo hashtypesum = "${file}.${hashtype}sum"
			echo
			echo calsum1 = $calsum1
			echo calsum2 = $calsum2
			echo calsum3 = $calsum3
			echo
			read -n 1 -s -r -p "Press ENTER key to continue !"
			echo
			echo -------------------------===== Separator =====-------------------------
			fi
			}	## end function

## -------------------------===== Separator =====-------------------------
		
debugcore

exist="$file".${hashtype}sum""

if test -f "$exist"; then
	echo "	An associated ${hashtype}sum files exist, autoread."
	#read -r firstline<"$file.shahash"
	#hashtypefile="$file".${hashtype}sum""

else
	echo "${green}	███████████████████████████████████████████████████████████████${reset}"
	echo
	echo "	OPTIONAL - Associated ${hashtype}sum file NOT exist, must select"
	echo "	an ${hashtype}sum.txt OR press CANCEL to create a file ${hashtype}sum.txt"
	echo
	echo "${green}	███████████████████████████████████████████████████████████████${reset}"
	echo
	echo "${yellow}	███████████████████████████████████████████████████████████████${reset}"
	echo
	echo "	You CANNOT mix files with md5, sha256, .... etc. SEPARATE hash."
	echo
	echo "${yellow}	███████████████████████████████████████████████████████████████${reset}"
	echo
	#echo "OPTIONAL - Associated ${hashtype}sum file NOT exist, must select OR press CANCEL to create a file."
	hashtypefile="$(zenity --file-selection --filename=$HOME/$USER --file-filter="*.${hashtype}sum *.txt" --title="OPTIONAL - Associated ${hashtype}sum file NOT found, must select OR press CANCEL to create a file *.${hashtype}sum *.txt")"

fi

## -------------------------===== Separator =====-------------------------

	readdata=1
	debugcore

echo
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
## If you press cancel on load you will create a new hash file

	if test -z "$hashtypefile"; then
		echo "You don't have selected a file. You will create a new *.${hashtype}sum file."
		cd /"$(dirname "${VAR1}")"
		echo
		echo "Your file to check is :"
		echo "$file"
		echo
		echo "!!! WAIT !!! Calculations started. The ckeck sum calculated is :"
		## OVERWRITE exixting hash
		${hashtype}sum "$file" | awk '{print $1}' > "${file}.${hashtype}sum"
		## Do NOT OVERWRITE exixting hash
		${hashtype}sum "$file" | awk '{print $1}' >> "${file}.${hashtype}sum"
		read -r calsum1 < "${file}.${hashtype}sum"
		export VAR3="$file"
		echo
		echo "$calsum1  $(basename "${VAR3}")" > "${file}.${hashtype}sum"
		echo
		echo Is writen : "$calsum1  $(basename "${VAR3}")"
		hashtypesum="${file}.${hashtype}sum"
	else
		echo "An ${hashtype}sum file is selected and continue (no creation)."
		echo
		echo "Hash included in file "$hashtypefile""
		echo
		cat "$hashtypefile"

		## read first line from file, but only the first
		#input="$hashtypefile"
		#while IFS= read -r firstline
		#	do
		#	echo "$firstline"
		#	calsum1=$(echo "$firstline" | grep -oE '^[a-f0-9]+')
		#	done < "$input"

		## read the GOOD line fron a txt file.
		#grep -n -w "$name1" "$hashtypefile"
		match=$(grep -n -w "$name1" "$hashtypefile")
		#echo $match
		string="$match"
		number=$(echo "$string" | grep -oE '[0-9]+' | head -1)
		#echo "$number"
		#echo sed -n "$number"p "$hashtypefile"
		#sed -n "$number"p "$hashtypefile"
		readline=$(sed -n "$number"p "$hashtypefile")
		calsum1=$(echo "$readline" | grep -oE '^[a-f0-9]+')
	fi

## -------------------------===== Separator =====-------------------------
	
	readdata=3
	debugcore

echo
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Veryfy variables."

	export VAR2="$file"

	echo
	echo Base directory : "$(dirname "${VAR2}")"
	echo Base name: "$(basename "${VAR2}")"
	echo
	echo "File selected = "$file""
	echo "Hash in auto-select file = "$calsum1""
	echo

## -------------------------===== Separator =====-------------------------

	## watch if hash is include in file you specified
	if test -z "$calsum1"; then
			echo "No matching lines found in file you specified."
			echo Press ENTER to EXIT !
			read name
			sleep 2
			exit
		else
			echo "File selected / line matched ; and continue."
			echo
			fi

## -------------------------===== Separator =====-------------------------

	readdata=4
	debugcore

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "!!! WAIT !!! Calculations started. If you press cancel on load you will create a new ${hashtype}sum file."
	echo

	echo "${hashtype}sum "$file" | awk '{print $1}' > "/dev/shm/""$(basename "${VAR2}")"".${hashtype}sum""
	${hashtype}sum "$file" | awk '{print $1}' > "/dev/shm/""$(basename "${VAR2}")"".${hashtype}sum"
	read -r calsum2 < "/dev/shm/""$(basename "${VAR2}")"".${hashtype}sum"
	echo "Your selected file for hash is : "
	echo "$file"
	echo
	echo "Your selected or auto-load ${hashtype}sum file is :"
	echo "${file}.${hashtype}sum"
	echo
	echo "The ckeck sum calculated is :"
	echo calsum2 = "$calsum2"
	## write new temp file
	echo "$calsum2 "$(basename "${VAR2}")"" > "/dev/shm/""$(basename  "${VAR2}")"".${hashtype}sum"
	echo
	echo "Visually compare these two lines ! calsum1 is file provided (or new hash) , calsum2 is new hash."
	echo calsum 1. = "$calsum1"
	echo calsum 2. = "$calsum2"
	echo

## -------------------------===== Separator =====-------------------------

	readdata=5
	debugcore

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "And the final answer is .... :"
	echo

	if [ "$calsum1" = "$calsum2" ]; then
			echo "		${green}█████████████████████████████████████████████████████████████${reset}"
			echo "		${green}██                                                         ██${reset}"
			echo "		${green}         ${hashtype}sum with compare hash is EQUAL       ${reset}"
			echo "		${green}██                                                         ██${reset}"
			echo "		${green}█████████████████████████████████████████████████████████████${reset}"
			sleep 3
		else
			printf '\033[8;26;100t'		# will resize the window.
			echo "		${red}███████████████████████████████████████████████████████████████████${reset}"
			echo "		${red}██                                                               ██${reset}"
			echo "		${red}         ${hashtype}sum with compare hash ARE NOT equal       ${reset}"
			echo "		${red}██                                                               ██${reset}"
			echo "		${red}███████████████████████████████████████████████████████████████████${reset}"
			primeerror=$((primeerror+1))
			echo
			read -n 1 -s -r -p "Press ENTER key to continue !"
			echo
		fi

## -------------------------===== Separator =====-------------------------

	readdata=6
	debugcore

echo
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Software lead out. Version 5.13"
	if [ "$reseize" -eq "1" ]; then
		printf '\033[8;25;100t'		## Will resize the window.
		fi
	echo
	echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit automatic=$automatic primeerror=$primeerror"
	echo "		random=$random random2=$random2 id=$id automatic=$automatic reseize=$reseize"
	echo
	echo -------------------------===== End of Bash ======-------------------------
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
	echo "	Debug data : debug=$debug error=$error part=$part noquit=$noquit automatic=$automatic primeerror=$primeerror random=$random random2=$random2 id=$id automatic=$automatic reseize=$reseize debugcore=$debugcore" >>/dev/shm/logs.txt
	echo "	File (If any used) : $file" >>/dev/shm/logs.txt
	echo " " >>/dev/shm/logs.txt
	echo "--------------------====== SEPARATOR ========--------------------" >>/dev/shm/logs.txt

## -------------------------===== Separator =====-------------------------
## Exit, wait or auto-quit.

	if [ "$primeerror" -ge "1" ]; then
		if [ "$reseize" -eq "0" ]; then
			printf '\033[8;30;91t'		## Will resize the window.
			fi
		echo "	${red}████████████████████████████████████████████${reset}"
		echo "	${red}██                                        ██${reset}"
		echo "	${red}██     Unknown entry event... ERROR(S)    ██${reset}"
		echo "	${red}██                                        ██${reset}"
		echo "	${red}████████████████████████████████████████████${reset}"
		echo
		echo "Numbers of error(s) : $primeerror"
		echo
		echo "Terminated : $me"
		echo
		#debug
		sleep=3
		functionsleepbar
		noquit=1
	else
		if [ "$reseize" -eq "0" ]; then
			printf '\033[8;19;91t'		## Will resize the window.
			fi
		echo
		echo "${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo "${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "${green}██         NO errors detected.        ██${reset}	${blue}██       Time needed : $date       ██${reset}"
		echo "${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo
		echo "Terminated : $me"
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

## -------------------------===== Start of eula =====-------------------------

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

## -------------------------===== End of file =====-------------------------
