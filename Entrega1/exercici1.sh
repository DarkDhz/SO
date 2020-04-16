#!bin/bash

if [ $# -ne 1 ]
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

count=0
# files ordered from bigger to smaller
files=$(ls -S $1)
for file in $files:
do 
	#Discard folders
    if [ -f $1$file ]
    then
    	bigger=$file
    	break
    fi	
done
#ls -s file - prints the size and the name of file
echo "$(ls -s $1$bigger)"
exit 0


