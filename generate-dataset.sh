#!/bin/bash
############################################################################
#Script “generate-dataset.sh <filename> <num_records>” uses two
#command line arguments specifying the file name to output and the number of
#records, where each record is separated by new line character, and each has 
#the following format: <integer> <integer> <ASCII_string>. The integers are 
#stored in binary format (4 bytes) and the ASCII_string as a string. 
############################################################################

filename=$1
numrecords=$(($2))
alphabet=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
rm -f $filename
#######Generate a random string for the third field####################
string=''
for i in {1..100} ; do
  string="$string${alphabet:RANDOM%${#alphabet}:1}" 
done
#######Generate $numrecords records ####################
#######Convert integers to binary ####################
i=1
for (( ; ; )) 
do
        if [[ $i -eq $numrecords ]]
        then
               break
        fi
        i=$((i+1))
        randnum=$(($RANDOM))
        binary=$(printf "%08x" $randnum | xxd -r -p)
        #echo "$randnum $randnum $string"
        echo "$binary $binary $string">>$filename
done
