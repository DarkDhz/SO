#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Nombre incorrecte de parametres"
	exit 1
fi

nom=$1


echo "Nombre de l'usuari: "
grep nom /etc/passwd | awk -F ':' '{print $4}'

echo "Identificador de l'usuari: "
grep nom /etc/passwd | awk -F ':' '{print $3}'

echo "Directori arrel de l'usuari: "
grep nom /etc/passwd | awk -F ':' '{print $6}'

echo "Interpret per defecte:  "
grep nom /etc/passwd | awk -F ':' '{print $7}'

echo "Grups als que pertany: "
grep nom /etc/group |  awk -F ':' '{print $1}'