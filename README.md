By LostByteSoft

Bash sha 256 verification help tool

BETA VESION !!! If you want help you're welcome !!


Things to do !

* auto load *.sha256 file if exist.
* create a .sha256 file after NEW calculation (create with correct format).
* select the good hash in file if many is present.
* maybe an gui.
* i'm sure there are more to do....


Easy way or not in bash to verify create and hash a file in sha 256.

Version 2021-01-29

* Files and use

sha256check.sh

THe main software. Will ask for 2 files (one after another) and compare the hash include in the second specified file.

testfile.txt

This is the test file to hash. I called this file : 09 F9 key

testfile.sha256

In this file there are the pre-calculated hash and the file name. You (if you create this file) must follow the corect format, or correct the file to respect the format. HOW: Is the hash code two (2) spaceS and the name of the file.

Exemple of the first line : 09f9....88c0  testfile.txt

sha256create.sh (NOT working)

Will create a file (with the same name of the file hashed) with inside hash and the file name.


I will drop win soft soon ...
