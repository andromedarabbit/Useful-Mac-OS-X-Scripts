#!/usr/bin/env bash 
# tested with proctools version of pkill.
PKILL_PATH=`which pkill`
if [ -z "PKILL_PATH" ]; then
    echo "pkill is not found!"
	exit 1
fi

# Check if user entered arguments
if [ $# -lt 1 ] ; then
	echo -n "Enter the process name which you want to kill: "
	read processName
else
	processName=$1
fi

"$PKILL_PATH" -i "$processName" 