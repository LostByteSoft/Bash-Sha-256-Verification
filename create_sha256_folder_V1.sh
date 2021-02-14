echo --- Start of file ---
#!/bin/bash
printf '\033[8;20;80t'		# will resize the window to 132 x 43 characters.
echo -----------------------------------------------------------------------------
echo "create_sha256_folder_V1 - Create hash sha-256 file for all files in folder"
echo "By LostByteSoft"
echo "Version 2021-02-14"
echo -----------------------------------------------------------------------------

echo I must be placed in the folder you want to make sha file, press ENTER !
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
