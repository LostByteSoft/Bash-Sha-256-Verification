By LostByteSoft

Bash sha 256 verification help tool

BETA VESION !!! If you want to help you're welcome !!

I'M WORKING ON A VERSION THAT TAKE THE GOOD LINE TO CHECK THE SHA.

ONLY ONE LINE IS SUPPORTED IN *.sha256 FILE.


Things to do !

* auto load *.sha256 file if exist.
* create a .sha256 file after NEW calculation (create with correct format).
* select the good hash in file if many is present.
* maybe an gui.
* i'm sure there are more to do....


Easy way or not in bash to verify create and hash a file in sha 256.

Version 2021-01-29

![Screenshot](Picture_5.jpg)

Version 2021-02-10

![Screenshot](Picture_6.jpg)

--------------------------------------------------------------------

* Files and use

Check_sha256.sh

THe main software. Will ask for 2 files (one after another, you can only provide one) and compare the hash include in the second specified file.

testfile.txt

This is the test file to hash. I called this file : 09 F9 key

testfile.sha256

In this file there are the pre-calculated hash and the file name. You (if you create this file) must follow the corect format, or correct the file to respect the format. HOW: Is the hash code two (2) spaceS and the name of the file.

Exemple of the first line : 09f9....88c0  testfile.txt

create_sha256.sh

Will create a file (with the same name of the file hashed) with inside hash and the file name.


I will drop win soft soon ...

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
