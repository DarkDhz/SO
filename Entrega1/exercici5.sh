#!/bin/bash
if [ $# -lt 2 ]
then 
    echo "Nombre incorrecte de parametres"
    exit 1
fi

#Check if Valid Dir
if [  ! -d $1 ]
then
	echo "Invalid Dir"
	exit 1
fi

#Check if dir is Empty
if [ -z "$(ls -A $1)" ]
then
    echo "Empty Dir"
    exit 1
fi 

#For every file in dir
for file in $(ls $1)
do 
	if [ -d $1/$file ] 
	then 
		#Recursive call
		./exercici5.sh $1/$file/ ${@:2}
	fi
	if [ -f $1/$file ]
	then 
		#Get file extension
		ext=${file##*.}
		index=0
		#For all extensions check if equals
		for extension in ${@:2}
		do
			if [[ $ext == $extension ]]
			then
				#Array of numer of files ( [0] First extension, [1] second extension, etc)
				array_count[$index]=$(expr ${array_count[$index]} + 1 )			
			fi
			index=$(expr $index + 1 )
		done
	fi
done

#If array is not empty, print array info
if [ ! -z $array_count ]
then
	index=0
	echo $1
	for ext in ${@:2}
	do
		if [ -z ${array_count[$index]} ]
		then
			echo "$ext:0"
		else
			echo "$ext:${array_count[$index]} "
		fi 
		index=$(expr $index + 1 )
	done	
fi
exit 0




