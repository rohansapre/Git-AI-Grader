#!/bin/bash

# text file to parse git handles one by one
file="names.txt"

while IFS= read -r gitHandle || [[ -n "$gitHandle" ]]
do
	# trimming leading and trailing white spaces
	gitHandle="${gitHandle##*( )}"
	gitHandle="${gitHandle%%*( )}"

	# ignore empty lines or comments
	if [ -z "$gitHandle" ] || [[ ${gitHandle:0:1} == '#' ]]
	then
		continue
	fi

	echo "$gitHandle"
done < "$file"