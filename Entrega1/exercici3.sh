#!bin/bash
if [ $# -ne 3 ]
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

len_word1=${#2}
len_word2=${#3}
words_count=0
realIFS=$IFS

#For every file in the dir
for file in $(ls $1)
do 
	#Discard folders
	if [ -f $1$file ]
	then 
		#get the content of the file
		content=$(cat $1/$file)
		IFS=$',.()!¡?¿\n:;\b\t\v\f\r\a""''-*#´ '
		for word in $content
		do 	
			#get the first x chars
			first_arg=${word:0:$len_word1}
			#get the last x chars
			last_arg=${word: -$len_word2}
			if [ "$first_arg" = "$2" ]
			then
				if [ "$last_arg" = "$3" ]
				then
					echo "$file:$word"
					words_count=$( expr $words_count + 1 )
				fi 
			fi
		done
		IFS=$realIFS
	fi
done
echo "Numero total de paraules: $words_count"
IFS=$realIFS
exit 0

