#!/bin/bash

if [ "$#" -ne 1 ]
then
	echo "Usage: ./pics.sh target_folder"
	exit 1
fi

for file in $1/*
do
	if [ -d $1 ]
	then
		continue
	fi

	create_date=$(exiftool $file | grep -m 1 'Create Date' | sed 's/  */ /g' | cut -d ' ' -f 4 | sed 's/:/_/g')

	if [ ! -d $1/$create_date ]
	then
		mkdir $1/$create_date
	else
		mv $file $1/$create_date
	fi
			
done
