#!/bin/bash
############################################################################
#Main script run-generate-dataset.sh runs generate-dataset.sh using the “time” 
#command to show how long the benchmark took to complete. The benchmark runs for 
#at least 10 seconds by the parent process sleeping. It uses a nohup command to 
#ignore all hangup (SIGHUP) signals and to keep running program in the background 
#after logging off.
#NOTE: generate-dataset.sh should be in the path
############################################################################
nohup time generate-dataset.sh $1 $2&

# Wait for 10 seconds
sleep 10

# Wait for the background process to finish
wait

# Check the number of records generated
numrecords=$(wc -l < $1)
if [[ $numrecords -gt $2 ]]
then
    numrecords=$2
fi
echo "Number of records generated: $numrecords"
