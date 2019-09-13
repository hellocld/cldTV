#!/bin/bash

# Create a lock directory to enure only one instance of the script is running

lockdir=~/Video/cldLock

if mkdir $lockdir
then
	while :
	do
		# get a random file from the video folder
		file=$(ls ~/Video/*[mp4,mkv] | sort -R | tail -1)
		echo $file
		# launch OMX with it
		omxplayer "$file"
	done
fi

