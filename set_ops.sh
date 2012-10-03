#!/bin/bash
#description: perform set operations (union, intersection, subtraction) on text files
#usage: set_ops.sh operator file1 file2 [file3 ...]
#  operator: 
#    n: intersection 
#    u: union
#    -: subtraction
op=$1
shift
files=$@
A=$1
shift
B=$1
shift
rest=$@
SORT='sort -i'
UNIQ='uniq -i'
if [ $op = "n" ]
then
        echo "taking intersection of $files"
        if [ -n "$rest" ]; then
		echo "can only take the intersection of two files"
		exit
	fi
        cat $files | $SORT | $UNIQ -d > intersection
        wc -l $files intersection
fi

if [ $op = "u" ]
then 
        echo "taking union of $files"
        cat $files | $SORT | $UNIQ > union
        wc -l $files union
fi

if [ $op = "-" ]
then
        out="${A}-${B}"
        echo "subtracting $B from $A -> $out"
        if [ -n "$rest" ]; then
		echo "can only take the intersection of two files"
		exit
	fi
        cat $B $A | $SORT | $UNIQ -d > .intersection.-
        cat .intersection.- $A | $SORT | $UNIQ -u > $out
        wc -l $B $A $out .intersection.-
fi
