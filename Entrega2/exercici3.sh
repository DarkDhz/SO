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

#Check if dir is Empty
if [ -z "$(ls -A $1)" ]
then
    echo "Empty Dir"
    exit 1
fi 

mkdir tmp
find $1 -type f -name "*.$2" -size +$3 -exec bash -c 'cp {} tmp/${{}##/}' \;

#Check if dir tmp is empty
if [ -z "$(ls -A tmp/)" ]
then
    rm -r tmp
    echo "No hi ha cap fitxer que compleixi amb les condicions especificades."
else
	#Compress the folder
	tar -zcvf fitxers.tar.gz tmp/*
	rm -r tmp
	echo "He comprimit els fitxers a fitxers.tar.gz"
fi 
#exit 0



