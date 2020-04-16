#!/bin/bash

if [ $# -ne 3 ]
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

#for every recursive file
for file in $(find $1 -type f)
do 	
	#-c count
	#-o only word
	count=$(grep -c -o $2"\S*"$3 $file)

	#check if exist coincidences
	if [ ! $count -eq 0 ]
	then
		echo "$file $count"
	fi
done
exit 0
