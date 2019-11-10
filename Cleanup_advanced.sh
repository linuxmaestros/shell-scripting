#!/bin/bash

LOG_DIR=/var/log 
ROOT_UID # Only users with $UID 0 have root privileges
LINES=50  # Default number of lines saved
E_XCD=86 
E_NOTROOT=87

# Run as root, of course
if [ "$UID" -ne "$ROOT_UID" ]
then
   echo "Must be root to run this script."
exit $E_NOTROOT
fi

if [ -n "$1" ]

# Test whether commandpline agument is present (non-empty).
then
   lines=$1
else
   lines=$LINES # Default, if not specified on command-line
fi

cd $LOG_DIR

if [ `pwd` != "$LOG_DIR"  # or if [ "$PWD" != "LOG_DIR" ]
then
   echo "Can't change to $LOG_DIR."
exit $E_XCD
fi  # Doublecheck if in right directory before messing with log file.

tail -n $lines messages > mesg.temp # Save last section of the message log file

mv mesg.temp messages

cat /dev/null > wtmp
echo "Log Files Cleaned Up"

exit 0
