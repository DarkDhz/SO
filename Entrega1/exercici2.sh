#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Nombre incorrecte de parametres"
    exit 1
fi

cadena=$1
longitud=${#cadena}
longitud=$(($longitud-2))
palidrom=$cadena
for (( i = longitud; i >= 0; i--))
do
palidrom=$palidrom${cadena:i:1}
done

echo $palidrom
exit 0
