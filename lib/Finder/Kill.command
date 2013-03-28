#!/usr/bin/env bash 
# tested with proctools version of pkill.
BIN_PATH=`which pkill`
if [ -z "BIN_PATH" ]; then
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

"$BIN_PATH" -i "$processName" 