#!/bin/bash

# Update the video collection 
# Called by systemd(?)

cd /home/pi/Video
youtube-dl --download-archive archive.txt "https://www.youtube.com/playlist?list=PLyCd3L0-Nx3Sj4byLyWzqeC2ih6yM8xct"
