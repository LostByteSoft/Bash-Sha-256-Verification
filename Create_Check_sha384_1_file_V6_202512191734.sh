#!/bin/bash
#!/usr/bin/ffmpeg

	echo "-------------------------===== Start of bash ====-------------------------"
	printf '\033[8;27;90t'	## minimum of 90 for graphics.
	version=2025-12-19_Friday_17:34:48
	hashtype=sha384

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
	printf '\033[8;20;90t'		## minimum of 90 for graphics.
	echo

## -------------------------=========== SEPARATOR =============-------------------------
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
		random=$(shuf -i 131072-524288 -n 1)	# Used for temp folders. A big number hard to guess for security reasons. 128-512
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

## -------------------------=========== SEPARATOR =============-------------------------

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
	echo "Lead-in Version 6.09. LostByteSoft ; https://github.com/LostByteSoft"
	echo
	echo "${blue}█████${reset} Activated $me"
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
	echo "By LostByteSoft, no copyright or copyleft. https://github.com/LostByteSoft"
	echo "Don't hack paid software, free software exists and does the job better."
	echo
	echo "Debug data : id=$id part=$part primeerror=$primeerror error=$error random=$random random2=$random2 logs=$logs"
	echo "	findsubfolders=$findsubfolders lowercase=$lowercase detox=$detox automatic=$automatic debug=$debug"
	echo "	debugcore=$debugcore minimize=$minimize maximize=$maximize reseize=$reseize noquit=$noquit"
	echo

echo -------------------------=========== SEPARATOR =============-------------------------
	echo "Color codes / Informations."
	echo
	echo   "${blue}	████████████████      INFORMATION(S)      ████████████████ ${reset}"
	echo  "${green}	████████████████     ALL OK / ACTIVE      ████████████████ ${reset}"
	echo "${yellow}	████████████████   ATTENTION / INACTIVE   ████████████████ ${reset}"
	echo "${orange}	████████████████                          ████████████████ ${reset}"
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
echo "Functions informations. Version 1.25"
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
			echo "${red}████████████████████ ERROR was detected !!! ████████████████████${reset}"
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
	## Version 2.26
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
	
	##-------------------------=========== SEPARATOR =============-------------------------

functionsleepbar() {

	if [ "$sleep" -ge "1" ]; then
			sleep1=$(echo "scale=2 ; "$sleep"/20" | bc)
			sleep2=$(echo "scale=2 ; "$sleep"/10" | bc)
		else
			sleep=3
			sleep1=$(echo "scale=2 ; "$sleep"/20" | bc)
			sleep2=$(echo "scale=2 ; "$sleep"/10" | bc)
		fi

	#if [[ -n "$color" ]]; then
	#		echo "color is $color"
	#	else
	#		color=green
	#		echo "color is set to $color"
	#	fi

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
	echo -ne ${green}"Sleep time $sleep sec. ${blue}	|███████|███████|███████|███████|███████|      (100%)\r"${reset}
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
echo "The core/code program. Check ${hashtype}sum. Version 6.373"
	echo

	## 0 or 1 , 0 deactivated , 1 activated ## All general variables must be 0 or 1
	debugcore=0

	## DO NOT CHANGE THESES VARIABLES.
	newhash=0
	readdata=0
	bypass=0
	calsum1=
	calsum2=
	name="$hashtype sum"

## -------------------------===== Separator =====-------------------------

	if [ "$debugcore" -eq "0" ]; then
		## normal operation
		printf '\033[8;20;90t'		# will resize the window.
	else
		## debugcore
		printf '\033[8;40;100t'		# will resize the window.
		noquit=1
		reseize=0
		sleep 2
	fi

## -------------------------===== Separator =====-------------------------

if command -v ${hashtype}sum >/dev/null 2>&1
	then
	echo "		${blue}████████████████████████████████████████████${reset}"
	echo "		${blue}██                                        ██${reset}"
	echo "		${blue}                 ${hashtype}sum        ${reset}"
	echo "		${blue}██                                        ██${reset}"
	echo "		${blue}████████████████████████████████████████████${reset}"
	echo
	else
		echo "${red}████████████████ You don't have ' ${hashtype}sum ' installed. ████████████████${reset}"
		echo
		read -n 1 -s -r -p "Press ENTER key to continue anyway (NOT a good idea) !"
		echo
		echo
	fi

## -------------------------===== Separator =====-------------------------

	debugcore() {
		if [ "$debugcore" -eq "1" ]; then
			echo
			echo "Read data : $readdata & part : $part"
			echo
			echo hashsum = ${hashtype}sum
			echo
			echo hashtypefile = $hashtypefile
			echo
			echo hashtypesum = "${file}.${hashtype}sum"
			echo
			echo calsum1 = $calsum1
			echo calsum2 = $calsum2
			echo
			echo "exist = $exist"
			echo
			exist1=$file
			echo "	exist1 = $exist1"
			exist2=${hashtype}
			echo "	exist2 = $exist2"
			exist3=${hashtype}sum
			echo "	exist3 = $exist3"
			exist4=$file.${hashtype}
			echo "	exist4 = $exist4"
			echo "	exist5 = $file.${hashtype}sum"
			echo
			read -n 1 -s -r -p "Press ENTER key to continue !"
			echo
			fi
			}	## end function

## -------------------------===== Separator =====-------------------------

	exist="$file.${hashtype}sum"
	#echo "	exist = $exist"
	#echo "	Searching for file named : $(basename "${VAR}").${hashtype}sum"
	#echo

## -------------------------===== Separator =====-------------------------

	readdata=1
	debugcore

## -------------------------===== Separator =====-------------------------
## -f file , -n variable , d folder

	if [ -f "$exist" ]; then
		echo "	An associated ${hashtype}sum file exist, autoread."
		hashtypefile=$exist
		echo "	hashtypefile = $hashtypefile"
	else
		echo "${blue}	███████████████████████████████████████████████████████████████${reset}"
		echo
		echo "	Associated $(basename "${VAR}").${hashtype}sum NOT found."
		echo
		echo "${blue}	███████████████████████████████████████████████████████████████${reset}"
		echo
		echo "${red}	You CANNOT mix hash files with md5, sha256, .... etc. SEPARATE hash files.${reset}"
		echo
		echo "${green}	███████████████████████████████████████████████████████████████${reset}"
		echo
		echo "	OPTIONAL - Select a file including ${hashtype}sum"
		echo
		echo "	OR - Press CANCEL to create a new ${hashtype}sum file :"
		echo
		echo "	"$file".${hashtype}sum"
		echo
		echo "${green}	███████████████████████████████████████████████████████████████${reset}"
		
		hashtypefile="$(zenity --file-selection --filename=$HOME/$USER \
		--file-filter="Only ${hashtype}sum | *.${hashtype}sum" \
		--file-filter="All SUM/SHA | *sum* *suM* *sUm* *sUM* *Sum* *SuM* *SUm* *SUM* *sha* *shA* *sHa* *sHA* *Sha* *ShA* *SHa* *SHA*" \
		--file-filter="All TXT | *.txt *.txt *.Txt *.tXt *.txT *.TXt *.TxT *.tXT *.TXT" \
		--file-filter="All files | *.*" --title="OPTIONAL - Associated ${hashtype} hash file NOT found, select one OR press CANCEL to create a new hash ${hashtype}sum file.")"
		fi

## -------------------------===== Separator =====-------------------------

	readdata=2
	debugcore

echo
part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
## If you press cancel on load you will create a new hash file

	if test -z "$hashtypefile"; then
		echo "You don't have selected a file. You will create a new .${hashtype}sum file."
		newhash=1
		cd /"$(dirname "${VAR1}")"
		echo
		echo "Your file to check is :"
		echo "$file"
		echo
		echo "${blue}	█████████████████ WORKING WAIT !!! ${hashtype} ███████████████████${reset}"
		echo
		${hashtype}sum "$file" | awk '{print $1}' > "${file}.${hashtype}sum"
		read -r firstline2<"${file}.${hashtype}sum"
		echo "$firstline2  $(basename "${VAR}")" > "${file}.${hashtype}sum"
		echo 'The ckeck sum calculated is (and write to file):'
		echo
		echo "$firstline2  $(basename "${VAR}")"
		echo
		echo 'To file:'
		echo
		echo "${file}.${hashtype}sum"
		echo
		calsum1=$firstline2
		if [ "$debugcore" -eq "1" ]; then
			echo Variable calsum1 : $calsum1
			echo
			fi
		calsum1=$calsum2
		bypass=1
		echo "${green}	█████████████████ FINISH ███████████████████${reset}"
		echo
	else
		echo "An ${hashtype}sum file is selected and continue (no creation)."
		newhash=0
		echo
		echo "	Hash included in file "$hashtypefile""
		echo
		cat "$hashtypefile"
		match=$(grep -n -w "$name1" "$hashtypefile")
		#echo $match
		string="$match"
		number=$(echo "$string" | grep -oE '[0-9]+' | head -1)
		#echo "$number"
		readline=$(sed -n "$number"p "$hashtypefile")
		calsum1=$(echo "$readline" | grep -oE '^[a-f0-9]+')

		if [ "$debugcore" -eq "1" ]; then
			echo readline=$(sed -n "$number"p "$hashtypefile")
			echo number=$(echo "$string" | grep -oE '[0-9]+' | head -1)
			echo read the GOOD line fron a txt file.
			echo grep -n -w "$name1" "$hashtypefile"
			echo $match
			echo "$number"
			echo sed -n "$number"p "$hashtypefile"
			echo sed -n "$number"p "$hashtypefile"
			read -n 1 -s -r -p "Press ENTER key to continue !"
			echo
			echo
			fi
	fi

## -------------------------===== Separator =====-------------------------
	
	readdata=3
	debugcore

## -------------------------===== Separator =====-------------------------

if [ "$bypass" -eq "0" ]; then
	echo
	part=$((part+1))
	echo "-------------------------===== Section $part =====-------------------------"
	echo "Veryfy variables."

		export VAR2="$file"

		echo
		echo "	Base directory : "$(dirname "${VAR2}")""
		echo "	Base name: "$(basename "${VAR2}")""
		echo
		echo "	File selected = "$file""
		echo "	Hash in auto-select file = "$calsum1""
		echo

	## -------------------------===== Separator =====-------------------------

		## watch if hash is include in file you specified
		if test -z "$calsum1"; then
				echo "No matching lines found in file you specified."
				echo
				echo Press ENTER to EXIT !
				read name
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
		echo
		echo "${blue}	█████████████████ WORKING WAIT !!! ${hashtype}sum ███████████████████${reset}"
		echo
		calsum2=$(${hashtype}sum "$file" | awk '{print $1}')
		echo
		echo "$file"
		echo
		echo "	The NEW ckeck sum calculated is : (Calsum2)"
		echo "	$calsum2"
		echo
		echo "	Visually compare these two lines ! calsum1 is file provided (or new hash) ,"
		echo "	Calsum 1 is new or selected file | Calsum2 is new hash."
		echo
		echo calsum 1 = "$calsum1"
		echo calsum 2 = "$calsum2"
		echo
		if [ "$logs" -eq "1" ]; then
			if [ "$calsum1" = "$calsum2" ]; then
				now6=$(date +"%Y-%m-%d_%H:%M")
				touch ""$(dirname "${VAR}")"/"$name1"_SUCESS_LOG_${now6}.${hashtype}"
				## Non compatible sum file log.
				#echo "$calsum2  $(basename "${VAR}") : OK" > ""$(dirname "${VAR}")"/"$name1"_SUCESS_LOG_${now6}.${hashtype}"
				## Compatible sum file log. (with 2 white spaces
				echo "$calsum2  $(basename "${VAR}")" > ""$(dirname "${VAR}")"/"$name1"_SUCESS_LOG_${now6}.${hashtype}"
				echo "Log created : "$(dirname "${VAR}")"/"$name1"_SUCESS_LOG_${now6}.${hashtype}"
				echo
				fi
			fi

		echo "${green}	█████████████████ FINISH ███████████████████${reset}"
		echo
fi

## -------------------------===== Separator =====-------------------------

	readdata=5
	debugcore

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Hash check."
	echo

	if [ "$newhash" -eq "0" ]; then
		if [ "$calsum1" = "$calsum2" ]; then
			echo "	${green}█████████████████████████████████████████████████████████████${reset}"
			echo "	${green}██                                                         ██${reset}"
			echo "	${green}              ${hashtype}sum with compare hash is EQUAL       ${reset}"
			echo "	${green}██                                                         ██${reset}"
			echo "	${green}█████████████████████████████████████████████████████████████${reset}"
			echo
			sleep=4
			color=green
			functionsleepbar
			echo
		else
			echo "	${red}███████████████████████████████████████████████████████████████████${reset}"
			echo "	${red}██                                                               ██${reset}"
			echo "	${red}                ${hashtype}sum with compare hash ARE NOT equal       ${reset}"
			echo "	${red}██                                                               ██${reset}"
			echo "	${red}███████████████████████████████████████████████████████████████████${reset}"
			echo
			sleep=8
			color=red
			functionsleepbar
			echo
			primeerror=$((primeerror+1))
			read -n 1 -s -r -p "Press ENTER key to continue !"
			echo
		fi
	fi

	if [ "$newhash" -eq "1" ]; then
		echo "	${green}█████████████████████████████████████████████████████████████${reset}"
		echo "	${green}██                                                         ██${reset}"
		echo "	${green}        New hash file with ${hashtype}sum has been calculated.       ${reset}"
		echo "	${green}██                                                         ██${reset}"
		echo "	${green}█████████████████████████████████████████████████████████████${reset}"
		echo
		sleep=4
		color=blue
		functionsleepbar
		echo
		fi

## -------------------------===== Separator =====-------------------------

	readdata=6
	debugcore
	
	reseize=1
	debugcore=0

part=$((part+1))
echo "-------------------------===== Section $part =====-------------------------"
echo "Software lead out. Version 7.34"
	echo

## -------------------------===== Start of eula =====-------------------------
	functioneula() {
		printf '\033[8;33;90t'		## Will resize the window.
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
	echo
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
		echo " " >> /dev/shm/logs.txt
		echo "	Time now : $now5" >> /dev/shm/logs.txt
		echo "	Time needed : $date" >> /dev/shm/logs.txt
		echo "	Started Time : $now" >> /dev/shm/logs.txt
		echo "	Name of software : $me" >> /dev/shm/logs.txt
		echo "	Debug random : id=$id part=$part primeerror=$primeerror error=$error random=$random random2=$random2" >> /dev/shm/logs.txt
		echo "	Debug : findsubfolders=$findsubfolders lowercase=$lowercase detox=$detox automatic=$automatic debug=$debug debugcore=$debugcore \
		minimize=$minimize maximize=$maximize reseize=$reseize noquit=$noquit" >> /dev/shm/logs.txt
		echo "	File (If any used) : $file" >>/dev/shm/logs.txt
		echo " " >>/dev/shm/logs.txt
		echo "--------------------====== SEPARATOR ========--------------------" >>/dev/shm/logs.txt
		fi

## -------------------------===== Separator =====-------------------------
## Exit, wait or auto-quit.

	echo -ne "\033]0;FINISH-$SCRIPT_NAME\a"

	if [ "$primeerror" -ge "1" ]; then
		printf '\033[8;22;90t'		## Will resize the window.
		echo "${red}████████████████████████████████████████████${reset}	${yellow}████████████████████████████████████████${reset}"
		echo "${red}██                                        ██${reset}	${yellow}██                                    ██${reset}"
		echo "${red}██     Unknown entry event... ERROR(S)    ██${reset}	${yellow}██       Time needed : $date       ██${reset}"
		echo "${red}██                                        ██${reset}	${yellow}██                                    ██${reset}"
		echo "${red}████████████████████████████████████████████${reset}	${yellow}████████████████████████████████████████${reset}"
		echo
		echo "Numbers of error(s) : $primeerror"
		echo
		echo "Terminated : $me"
		echo
		noquit=1
	else

		printf '\033[8;19;90t'		## Will resize the window.
		echo "${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo "${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "${green}██         NO errors detected.        ██${reset}	${blue}██       Time needed : $date       ██${reset}"
		echo "${green}██                                    ██${reset}	${blue}██                                    ██${reset}"
		echo "${green}████████████████████████████████████████${reset}	${blue}████████████████████████████████████████${reset}"
		echo
		echo "Terminated : $me"
		echo
	fi

	## -------------------------===== Separator =====-------------------------
	if [ "$noquit" -eq "1" ]; then
		if [ "$primeerror" -eq "0" ]; then
				echo "${blue}	█████████████████ NO exit activated ███████████████████${reset}"
			else
				echo "${orange}	█████████████████ NO exit activated ███████████████████${reset}"
			fi
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
			echo
			fi

	## -------------------------===== Separator =====-------------------------
	if [ "$debug" -eq "1" ]; then
		debug
		echo "${blue}		█████ DEBUG WAIT | Program finish. █████${reset}"
		echo
		read -n 1 -s -r -p "Press any key to EXIT or press X to close this windows !"
		echo
		echo
		exit 0
		fi

	## -------------------------===== Separator =====-------------------------

	echo "${green}	███████████████ Finish, quit in 3 seconds █████████████████${reset}"
	echo
	functionsmallbar
	echo
	exit 0

## -------------------------===== End of file =====-------------------------
