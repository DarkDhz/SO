#!/bin/bash

if [ $# -ne 1 ]
then 
    echo "Nombre incorrecte de paràmetres"
    exit 1
fi

#Check if Valid Dir
if [  ! -d $1 ]
then
    echo "Invalid Dir"
    exit 1
fi

#get all recursive dirs
dirs=$(find $1 -type d)

#for every recursive dir
for dir in $dirs
do 
	#-maxDepth for not entering in recursion
	#Sort nk1 - column 1 is file size
	#wc -c to get file size
	sorted_files=$(find $dir -maxdepth 1  -type f -exec wc -c {} \; | sort -nk1 -r | head -n3 )
	echo "Directori: $dir"
	echo "$(echo "$sorted_files" | sort -nk1 )"

done