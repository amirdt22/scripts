#!/bin/bash
#description: print a historgram of STDIN
#usage: cat listOfThings | histogram.sh 
field=$1
delim=$2
file=$3
if [ -z $field ]; then
        field=1
fi
delimc="-F$delim"
if [ -z $delim ]; then
        delimc=' ' 
fi
awk $delimc "{hist[\$$field]++} END {for (occ in hist) print hist[occ] \"\t\" occ }" $3 | sort -n
