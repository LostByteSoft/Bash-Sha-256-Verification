FREE Linux Bash software by LostByteSoft

No CopyRIGHT or CopyLEFT, i am juste in the CopyCENTER. That not perfect but me neither.

Bash sha 256/512 verification help tool

BETA VESION !!! If you want to help you're welcome !!

I'M WORKING ON A VERSION THAT TAKE THE GOOD LINE TO CHECK THE SHA FILE.

ONLY ONE LINE IS SUPPORTED IN *.sha256 FILE.




Things to do !

* auto load *.sha256 file if exist.
* select the good hash in file if many is present.
* maybe an gui.
* Other check : sha512, crc32 , ...
* i'm sure there are more to do....



Easy way or not in bash to verify create and hash a file in sha 256.

Version 2021-01-29

![Screenshot](Picture_5.jpg)

Version 2021-02-10

![Screenshot](Picture_6.jpg)

--------------------------------------------------------------------

* Files and use

Check_sha256.sh
Check_sha512.sh

The main software. Will ask for 2 files (one after another, or you can only provide one) and compare the hash include in the second specified file. If only one file is provided (the first one) the sh will create an sha256 ou sha512 file.

create_sha256.sh
create_sha512.sh

Ask for one file to hash and create *.sha256 or *.sha512 file.

testfile.txt

This is the test file to hash.

testfile.txt.sha256

In this file there are the pre-calculated hash and the file name. You (if you create this file) must follow the corect format, or correct the file to respect the format. HOW: Is the hash code plus two (2) spaceS and the name of the file. Only the first line is revelant for now.

Exemple of the first line : 0ca160e99aa0e719a4926797292654f9a26bc9591beee21a8ec6f2808616acee  testfile.txt

Only the first line is revelant for now.






FREE Linux Bash software by LostByteSoft

--- End of readme ---

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   Version 3.14159265358979323846264338327950288419716939937510582
                          March 2017

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

              You just DO WHAT THE FUCK YOU WANT TO.

		     NO FUCKING WARRANTY AT ALL

	As is customary and in compliance with current global and
	interplanetary regulations, the author of these pages disclaims
	all liability for the consequences of the advice given here,
	in particular in the event of partial or total destruction of
	the material, Loss of rights to the manufacturer's warranty,
	electrocution, drowning, divorce, civil war, the effects of
	radiation due to atomic fission, unexpected tax recalls or
	    encounters with extraterrestrial beings 'elsewhere.

              LostByteSoft no copyright or copyleft.

	If you are unhappy with this software i do not care.
	
--- End of licence ---
