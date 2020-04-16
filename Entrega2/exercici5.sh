#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Nombre incorrecte de paràmetres"
	exit 1
fi

par2=$2
if [[ "${par2}" == "VSZ" ]] || [[ "${par2}" == "RSS" ]] || [[ "${par2}" == "vsz" ]] || [[ "${par2}" == "rss" ]] 
then
	un=$1

	va=($(ps aux | grep -E '^'$1))
	if [ -z $va ]
		then
			echo "Aquest usuari no té cap procés associat"
			exit 1
		fi
	if [ $1 == VSZ ]
		then
			par2=vsz	
		else 
			par2=rss
		fi
		echo -e "VSZ\t RSS\t PROCESS"
		ps aux --sort=-"${par2}" | grep -E '^'$1 | awk '{print $5"\t"$6"\t"$11}' | head -n10
		exit 0
fi
echo "L'argument ha de ser RSS o VSZ"
exit 1
