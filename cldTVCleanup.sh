#!/bin/bash

# Removes the lockfolder created by cldTV.sh
# To be run by systemd on shutdown 

rmdir ~/Videos/cldLock
