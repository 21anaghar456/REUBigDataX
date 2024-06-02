#!/bin/bash
################################################################################################################
#Script “sort-data.sh” takes input a file from part (a) and sorts the file based on solely the first column data 
#and not the entire line of data. The linux sort command is used to make sure the data in column 1 is treated as 
#numbers and not text. It uses the “time” command to show how long the sort script took to complete.
################################################################################################################

filename=$1
sort -n -k1,1 "$filename" -o "$filename.sortedoutput"

echo "Output file is $filename.sortedoutput"
