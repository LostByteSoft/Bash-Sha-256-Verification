#!/bin/bash
#!/usr/bin/ffmpeg

	echo "-------------------------===== Start of bash ====-------------------------"
	printf '\033[8;27;90t'	## minimum of 90 for graphics.
	version=2025-10-20_Monday_20:06:51
	hashtype=sha256

	## "0 or 1 , 0 deactivated , 1 activated ## All general variables must be 0 or 1"
		findsubfolders=0
		lowercase=0
		detox=0
		automatic=1
		debug=0
		debugcore=0
		minimize=0
		maximize=0
		reseize=1
		noquit=1

	SCRIPT_NAME=$(basename "$0")
	echo -ne "\033]0;$SCRIPT_NAME\a"

##-------------------------=========== SEPARATOR =============-------------------------
## Lead-in Version 6.06
	echo
	echo
	## Time, host name, file name, pid.
		start=$SECONDS
		now=$(date +"%Y-%m-%d_%A_%H:%M:%S")	## time now
		hostname=$(cat /etc/hostname)
		#hostname="${hostname%-pc}"
		me="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
		id=$(echo $PPID)			## current process id of the bash process
	## General purposes variables. Needed before program to random variables.
		logs=1		## Logging
	## All general variables must be 0, DO NOT CHANGE.
		part=0		## Don't change this value.
		primeerror=0	## Ending error detector, do not change.
		error=0		## Test error, do not change.
	## Auto-generated variables. DO NOT CHANGE.
		random=$(shuf -i 4096-131072 -n 1)	# Used for temp folders. A big number hard to guess for security reasons.
		random2=$RANDOM
	## Colors codes
		red=$(tput setaf 1)
		green=$(tput setaf 2)
		yellow=$(tput setaf 11)
		blue=$(tput setaf 12)
		orange=$(tput setaf 9)
		reset=$(tput sgr0)
	## Name of the pc you are running this bash.
		comuputerrunning=$(hostname)
		comuputerrunning=${comuputerrunning//-pc/}

##-------------------------=========== SEPARATOR =============-------------------------

	printf '\033[8;20;90t'		## minimum of 90 for graphics.
	echo
	echo
	echo "${green}  ░▒▓█▓▒░      ░▒▓██████▓▒░ ░▒▓███████▓▒░▒▓████████▓▒░ "
	echo "${green}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${green}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${green}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░   ░▒▓█▓▒░     "
	echo "${green}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░     "
	echo "${green}  ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░  ░▒▓█▓▒░     "
	echo "${green}  ░▒▓████████▓▒░▒▓██████▓▒░░▒▓███████▓▒░   ░▒▓█▓▒░     ${reset}"
	echo
	echo "${green}	  ░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓████████▓▒░ "
	echo "${green}	  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░        "
	echo "${green}	  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░        "
	echo "${green}	  ░▒▓███████▓▒░ ░▒▓██████▓▒░   ░▒▓█▓▒░   ░▒▓██████▓▒░   "
	echo "${green}	  ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░        "
	echo "${green}	  ░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░        "
	echo "${green}	  ░▒▓███████▓▒░   ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓████████▓▒░ ${reset}"
	echo
	echo "${green}		   ░▒▓███████▓▒░░▒▓██████▓▒░░▒▓████████▓▒░▒▓████████▓▒░ "
	echo "${green}		  ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${green}		  ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${green}		   ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░    ░▒▓█▓▒░     "
	echo "${green}			 ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${green}			 ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░     "
	echo "${green}		  ░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░         ░▒▓█▓▒░  ${reset}"
	echo

echo -------------------------=========== SEPARATOR =============-------------------------
	echo "Software lead-in. LostByteSoft ; https://github.com/LostByteSoft"
	echo
	echo "$me"
	echo
	echo "Version : $version"
	echo
	echo "NEVER remove dual ## in front of lines. Theses are code annotations."
	echo "You can test / remove single # for testing purpose."
	echo
	echo "Current time : $now"
	echo
	echo "You are running this script from : $comuputerrunning"
	echo
	echo "Running software file : $(dirname "$0")/"
	echo
	echo "Read me for this file : (EULA at the end of file, open in text.)"
	echo
	echo "By LostByteSoft, no copyright or copyleft. https://github.com/LostByteSoft"
	echo
	echo "Don't hack paid software, free software exists and does the job better."
	echo
	echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2"
	echo "		primeerror=$primeerror lowercase=$lowercase id=$id reseize=$reseize"
	echo

echo -------------------------=========== SEPARATOR =============-------------------------
	echo "Color codes / Informations."
	echo
	echo   "${blue}	████████████████      INFORMATION(S)      ████████████████ ${reset}"
	echo  "${green}	████████████████     ALL OK / ACTIVE      ████████████████ ${reset}"
	echo "${yellow}	████████████████   ATTENTION / INACTIVE   ████████████████ ${reset}"
	echo "${orange}	████████████████         WARNING          ████████████████ ${reset}"
	echo    "${red}	████████████████   FATAL ERROR / OFFLINE  ████████████████ ${reset}"
	echo

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
	echo Check installed requirements !
	echo
if command -v xdotool >/dev/null 2>&1
	then
		echo "xdotool installed continue."
		dpkg -s xdotool | grep Version
		echo "${green}████████████████ OK ████████████████ ${reset}"
		echo
		xdotoolinstall=1
	else
		echo "You don't have ' xdotool ' installed."
		echo "Add with : sudo apt-get install xdotool"
		echo
		echo "${blue}████████████████ Dependency information ████████████████${reset}"
		echo
		xdotoolinstall=0
	fi

## -------------------------===== Separator =====-------------------------
part=$((part+1))
echo -------------------------===== Section $part =====-------------------------
echo "Functions informations. Version 1.24"
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
		if [ "$debug" -eq "1" ]; then
			echo
			echo "${blue}		█████ DEBUG █████${reset}"
			echo
			echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit automatic=$automatic primeerror=$primeerror"
			echo "		random=$random random2=$random2 id=$id automatic=$automatic reseize=$reseize"
			echo
			reseize=0
			minimize=0
			maximize=0
			noquit=1
			printf '\033[8;45;150t'		## Will resize the window.
			fi
			}

##-------------------------=========== SEPARATOR =============-------------------------
## error function

	error() {
		if [ "$?" -ge 1 ]; then
			reseize=0
			noquit=1
			automatic=0
			primeerror=$((primeerror+1))
			echo
			echo "${red}█████████████████████████████████ ERROR SECTION $part █████████████████████████████████${reset}"
			echo
			echo "!!! ERROR was detected !!!" ## Press ANY key to try to CONTINUE !!!
			debug
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

	name=MINIMIZE
	explain="Minimize the program."
	if [ "$minimize" -eq "0" ]; then
		echo 	"Function ${blue}█████${reset} Default deactivated $name . $explain"
	else
		echo 	"Function ${green}█████${reset} Activated $name . $explain"
	fi

if [ "$minimize" -eq "1" ]; then
	pid=$(echo $PPID)
	if [ "$xdotoolinstall" -eq "1" ]; then
			echo
			echo "Function ${blue}█████ Minimize activated. ${yellow}pid = $pid${reset}${reset}"
			sleep 0.2
			window_id=$(xdotool search --pid $pid | tail -1)
			sleep 0.2
			#echo pid = $pid | window_id = $window_id
			xdotool windowminimize "$window_id"
			sleep 0.2
		else
			echo "${yellow} █████ xdotool not installed : pid = $pid${reset}"
		fi
	fi
	echo

##-------------------------=========== SEPARATOR =============-------------------------

	name=MAXIMIZE
	explain="Maximize the program."
	if [ "$maximize" -eq "0" ]; then
		echo 	"Function ${blue}█████${reset} Default deactivated $name . $explain"
	else
		echo 	"Function ${green}█████${reset} Activated $name . $explain"
	fi

if [ "$maximize" -eq "1" ]; then
	pid=$(echo $PPID)
	if [ "$xdotoolinstall" -eq "1" ]; then
			echo "Function ${blue}█████ Maximize activated. ${yellow}pid = $pid${reset}"
			sleep 0.2
			window_id=$(xdotool search --pid $pid | tail -1)
			sleep 0.2
			#echo pid = $pid | window_id = $window_id
			xdotool windowmaximize "$window_id"
			sleep 0.2
		else
			echo "${yellow}█████ xdotool not installed : pid = $pid${reset}"
		fi
	fi

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
	}

##-------------------------=========== SEPARATOR =============-------------------------
## Simple function small bar to wait 3 sec. This bar does work with debian 12 & 13. Version 1.05

	functionsmallbar() {
		speed=0.2
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
		}

## -------------------------===== Separator =====-------------------------
echo
echo -------------------------========================-------------------------
echo "Select folder using dialog !"
	echo

	file=$(zenity --file-selection --filename=$HOME/ --title="Choose a directory." --directory)	## Directory select.
	## file="/$HOME/Pictures/"
	## file="/$HOME/Downloads/"
	## --file-filter="*.jpg *.gif"
	## --file-filter='*[WwEeBbPp] | *[JjPpGg]'

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

	if [ "$debug" -eq "1" ]; then
		debug
		echo "${blue}		█████ DEBUG WAIT █████${reset}"
		echo
		sleep=3
		functionsleepbar
		echo
		fi
	
echo -------------------------========================-------------------------
## Version 4,00
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
	#echo "Output name bis 1 : "$name1""
	name1="$name1"
	echo "Output name bis : "$name1""
	echo

## Debug data
	echo "Debug data : debug=$debug error=$error part=$part noquit=$noquit random=$random random2=$random2"
	echo "		primeerror=$primeerror lowercase=$lowercase id=$id reseize=$reseize"
	echo
	if [ "$debug" -eq "1" ]; then
		debug
		echo "${blue}		█████ DEBUG WAIT █████${reset}"
		echo
		echo "Debug data: $file"
		echo
		sleep=3
		functionsleepbar
		echo
		fi

echo -------------------------========================-------------------------
echo "The core/code program. Version 6.348"
	echo

	## 0 or 1 , 0 deactivated , 1 activated ## All general variables must be 0 or 1
	debugcore=0

	name1="${name1// /_}"
	export VAR1="$file"
	rm "/dev/shm/${hashtype}sum.${hashtype}sum" 2> /dev/null
	touch "/dev/shm/$random.txt"

	echo "${blue}█████${reset} Debug data :"
	echo
	echo "Hash type : $hashtype"
	echo "Selected folder = $file"
	echo "No spaces is supported in the name file, hash name will be :"
	echo "$name1.${hashtype}sum"
	echo

## -------------------------===== Separator =====-------------------------

	if [ "$debugcore" -eq "0" ]; then
		## normal operation
		printf '\033[8;20;90t'		# will resize the window.
	else
		## debugcore
		printf '\033[8;40;100t'		# will resize the window.
		echo
		echo "/dev/shm/$random.txt"
		echo name1 = $name1
		echo debugcore = $debugcore
		echo
		echo hash type : ${hashtype}sum
		echo
		echo "dirname = "$(dirname "${VAR1}")""
		echo
		echo "basename = "$(basename "${VAR1}")""
		echo
		noquit=1
		reseize=0
	fi

## -------------------------===== Separator =====-------------------------
## Read and remove line

	functionremovehashname () {
		if [ "$debugcore" -eq "1" ]; then
			echo "DEBUG : grep -v "${hashtype}sum" "/dev/shm/${hashtype}sum.${hashtype}sum" > "/dev/shm/${hashtype}sum.${hashtype}sum1""
			echo
			echo "DEBUG : cp "/dev/shm/${hashtype}sum.${hashtype}sum1" "$file/$name1.${hashtype}sum""
			echo
			reseize=0
			noquit=1
			fi

		## remove selected type
		grep -v "md5sum" "/dev/shm/$random.txt" > "/dev/shm/$random.txt1"
		grep -v "sha256sum" "/dev/shm/$random.txt1" > "/dev/shm/$random.txt2"
		grep -v "sha384sum" "/dev/shm/$random.txt2" > "/dev/shm/$random.txt3"
		grep -v "sha512sum" "/dev/shm/$random.txt3" > "/dev/shm/$random.txt5"
		grep -v "md5" "/dev/shm/$random.txt5" > "/dev/shm/$random.txt7"
		grep -v "sha256" "/dev/shm/$random.txt7" > "/dev/shm/$random.txt9"
		grep -v "sha384" "/dev/shm/$random.txt9" > "/dev/shm/$random.txt11"
		grep -v "sha512" "/dev/shm/$random.txt11" > "/dev/shm/$random.txt13"
		## remove folder name
		grep -v "$name1" "/dev/shm/$random.txt13" > "/dev/shm/$random.txt15"
		}
	
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Select YES or NO. Subfolders."
	echo

if zenity --question --text="YES i want the subfolder(s).\n\nNO i don't want subfolders." --title="Directory save."; then
	
		echo "Include subfolder..."
		echo
		echo "${blue}	█████████████████ WORKING WAIT !!! ${hashtype} ███████████████████${reset}"
		echo
		cd "$file"
		find . -type f > "/dev/shm/$random.txt"

	else

		echo "NO subfolder..."
		echo
		echo "${blue}	█████████████████ WORKING WAIT !!! ${hashtype}sum ███████████████████${reset}"
		echo
		cd "$file"
		find . -maxdepth 1 -type f > "/dev/shm/$random.txt"

	fi

## -------------------------===== Separator =====-------------------------

	functionremovehashname
	cat "/dev/shm/$random.txt15" | xargs -r -d '\n' ${hashtype}sum | tee "/dev/shm/${hashtype}sum.${hashtype}sum"
	error
	count=$(grep -c "" "/dev/shm/$random.txt1")
	cp "/dev/shm/${hashtype}sum.${hashtype}sum" "$file/$name1.${hashtype}sum"

	echo "${green}	█████████████████ FINISH ███████████████████${reset}"
	echo
	part=$((part+1))
	echo "-------------------------===== Section $part =====-------------------------"
	echo
	echo "File created :"
	echo
	echo "$file/$name1.${hashtype}sum"
	echo
	echo Numbers of files hashed : $count
	echo

	if [ "$debugcore" -ge "1" ]; then
		read -n 1 -s -r -p "DEBUG - Press any key to continue."
		echo
		echo
		fi

## -------------------------===== Separator =====-------------------------

	if [ "$primeerror" -ge "1" ]; then
		read -n 1 -s -r -p "Press any key to continue."
		echo
		fi

	sleep=4
	functionsleepbar
	echo

## -------------------------===== Separator =====-------------------------
## Temp file eraser

	random=81225
	rm /dev/shm/$random.* 2> /dev/null
	rm "/dev/shm/${hashtype}sum.${hashtype}sum" 2> /dev/null

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Software lead out. Version 7.28"
	echo

## -------------------------===== Start of eula =====-------------------------
	functioneula() {
		if [ "$reseize" -eq "1" ]; then
			printf '\033[8;31;90t'		## Will resize the window.
			fi
		echo
		echo "End-user license agreement (eula)"
		echo
	 	echo "JUST DO WHAT THE F*** YOU WANT WITH THE PUBLIC LICENSE"
		echo	 	
	 	echo "Version 3.1415926532 (January 2022)"
		echo
	 	echo "TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION"
		echo
		echo "Everyone is permitted to copy and distribute verbatim or modified copies of"
	 	echo "this license document."
		echo
	 	echo "As is customary and in compliance with current global and interplanetary"
	 	echo "regulations, the author of these pages disclaims all liability for the"
	 	echo "consequences of the advice given here, in particular in the event of partial"
	 	echo "or total destruction of the material, Loss of rights to the manufacturer"
	 	echo "warranty, electrocution, drowning, divorce, civil war, the effects of radiation"
	 	echo "due to atomic fission, unexpected tax recalls or encounters with"
	 	echo "extraterrestrial beings elsewhere."
		echo
	 	echo "YOU MUST ACCEPT THESES TERMS OR NOTHING WILL HAPPEN."
		echo
	 	echo "LostByteSoft no copyright or copyleft we are in the center."
		echo
	 	echo "You can send your request and your Christmas wishes to this address:"
		echo
	 	echo "	Père Noël"
	 	echo " 	Pôle Nord, Canada"
	 	echo "	H0H 0H0"
	 	echo
	 	}

## -------------------------===== Separator =====-------------------------

	echo "Debug random : id=$id part=$part primeerror=$primeerror error=$error random=$random random2=$random2"
	echo
	echo "Debug : findsubfolders=$findsubfolders lowercase=$lowercase detox=$detox automatic=$automatic"
	echo "	debug=$debug debugcore=$debugcore minimize=$minimize maximize=$maximize reseize=$reseize noquit=$noquit"
	echo
	echo -------------------------===== End of Bash ======-------------------------
	echo "Finish... with numbers of actions : $part"
	echo "This script take $(( SECONDS - start )) seconds to complete."
	echo "Started Time : $now"
	date=$(date -d@$(( SECONDS - start )) -u +%H:%M:%S)
	echo "Time needed: $date"
	now5=$(date +"%Y-%m-%d_%A_%H:%M:%S")
	echo "Current time : $now5"
	echo

## -------------------------===== Separator =====-------------------------

	if [ "$logs" -eq "1" ]; then
		echo " " >>/dev/shm/logs.txt
		echo "	Time now : $now5" >>/dev/shm/logs.txt
		echo "	Time needed : $date" >>/dev/shm/logs.txt
		echo "	Started Time : $now" >>/dev/shm/logs.txt
		echo "	Name of software : $me" >>/dev/shm/logs.txt
		echo "	Debug random : id=$id part=$part primeerror=$primeerror error=$error random=$random random2=$random2" >>/dev/shm/logs.txt
		echo "	Debug : findsubfolders=$findsubfolders lowercase=$lowercase detox=$detox automatic=$automatic debug=$debug debugcore=$debugcore \
		minimize=$minimize maximize=$maximize reseize=$reseize noquit=$noquit" >>/dev/shm/logs.txt
		echo "	File (If any used) : $file" >>/dev/shm/logs.txt
		echo " " >>/dev/shm/logs.txt
		echo "--------------------====== SEPARATOR ========--------------------" >>/dev/shm/logs.txt
		fi

## -------------------------===== Separator =====-------------------------
## Exit, wait or auto-quit.

	echo -ne "\033]0;FINISH-$SCRIPT_NAME\a"

	if [ "$primeerror" -ge "1" ]; then
		if [ "$reseize" -eq "1" ]; then
			printf '\033[8;35;90t'		## Will resize the window.
			fi
		echo "${red}████████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo "${red}██                                        ██${reset}	${blue}██                                    ██${reset}"
		echo "${red}██     Unknown entry event... ERROR(S)    ██${reset}	${blue}██       Time needed : $date       ██${reset}"
		echo "${red}██                                        ██${reset}	${blue}██                                    ██${reset}"
		echo "${red}████████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo
		echo "Numbers of error(s) : $primeerror"
		echo
		echo "Terminated : $me"
		echo
		noquit=1
	else
		if [ "$reseize" -eq "1" ]; then
			printf '\033[8;19;90t'		## Will resize the window.
			fi
		echo "${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo "${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "${green}██         NO errors detected.        ██${reset}	${blue}██       Time needed : $date       ██${reset}"
		echo "${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo
		echo "Terminated : $me"
	fi

	## -------------------------===== Separator =====-------------------------
	if [ "$noquit" -eq "1" ]; then
		echo
		echo "${blue}	█████████████████ NO exit activated ███████████████████${reset}"
		echo
		while true; do 
			echo "Press ANYKEY to show EULA, ENTER or SPACE to EXIT." 
			read -r -n 1 -s input_key
			if [[ -n "input_key" ]]; then 
				if [[ "input_key" == " " || -z "$input_key" ]]; then 
					break 
				else
					functioneula
					read -n 1 -s -r -p "Press any key to EXIT." 
					echo	
					break
				fi 
			else
					break 
				fi 
			done
			fi

	## -------------------------===== Separator =====-------------------------
	if [ "$debug" -eq "1" ]; then
		debug
		echo "${blue}		█████ DEBUG WAIT | Program finish. █████${reset}"
		echo
		read -n 1 -s -r -p "Press any key to EXIT or press X to close this windows !"
		fi

	## -------------------------===== Separator =====-------------------------

	echo
	echo "${green}	███████████████ Finish, quit in 3 seconds █████████████████${reset}"
	echo
	functionsmallbar
	echo
	exit 0

## -------------------------===== End of file =====-------------------------
