#!/bin/bash
# $1 == CSV BOM to match.

. ubiquitous_bash.sh

echo "Enter line number to search for a match in the specified BOM file. Ctrl+C to exit."

while read lineNum
do
	part=$(head -n "$lineNum" "$(getScriptAbsoluteFolder)/invoice.txt" | tail -n 1)
	
	echo -en '\E[1;34m'
	if grep "$part" "$1"
	then
		grep "$part" "$1" | cut -f1 -d\,
		echo -n $(grep "$part" "$1" | cut -f1 -d\,) | xsel -pbsi
		echo -e '\E[1;32;46m MATCH \E[0m'
	else
		echo -e '\E[1;33;41m NOT FOUND \E[0m'
	fi
done
