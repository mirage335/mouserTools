#!/bin/bash
#Takes a typical mouser invoice PDF file as of 5/7/2015, outputs an ordered list of part numbers as a lookup table.

pdftotext -layout "$1" "-" | grep '^\ *[0-9]*\ *[0-9]*\-.*$' | grep -v '[0-9]*\ *of[0-9]*\ *' | sed 's/\ \+/ /g' | sed 's/^\ //' | cut -d\  -f2 > invoice.txt