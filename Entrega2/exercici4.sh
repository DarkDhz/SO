#!/bin/bash

if [ $# -ne 1 ]
then 
    echo "Nombre incorrecte de paràmetres"
    exit 1
fi

#base dir
etc_dir="/home/arnau/scripts/practicas/exercici4"

#find user info
grep_result=$(grep $1 $etc_dir/passwd)
#find user name
user=$(echo "$grep_result" | awk '{print $1}' )

#check if username is valid or not
if [ -z "$user" ]
then 
    echo "Aquest usuari no existeix en aquest ordinador."
    exit
else

	#get user info -F:to ignore spaces
	name=$(echo "$(grep $1 $etc_dir/passwd)" | awk -F: '{print $5}' )
	user_id=$(echo "$grep_result" | awk -F: '{print $3}' )
	root_dir=$(echo "$grep_result" | awk -F: '{print $6}' )
	interpret=$(echo "$grep_result" | awk -F: '{print $7}' )
	group_id=$(echo "$grep_result" | awk -F: '{print $4}' )

	#get primary user group
	group_list="$(echo "$( grep $group_id $etc_dir/group | awk -F: '{print $1}') ($group_id)"),"
	#get all group info from user
	#sed for replacing : for espace
	for group in $(sed "s/:/ /g" $etc_dir/group | grep $1 | awk '{print $1}' )
	do
		group_list="$group_list $(echo "$group ($(sed "s/:/ /g" $etc_dir/group | grep $group | awk '{print $3}' ))")," 
	done

	#print info
	echo "Nom de l’usuari: $name "
	echo "Identificador de l’usuari: $user_id"
	echo "Grups als quals pertany l’usuari: $group_list"
	echo "Directori arrel de l’usuari: $root_dir"
	echo "Intèrpret per defecte: $interpret"
fi

