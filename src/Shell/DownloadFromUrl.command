#!/usr/bin/env bash
 
# This script is used to download a file from the target url.
# Resume a failed download.

# Check if curl exists
BIN_PATH=`which curl`
if [ -z "BIN_PATH" ]; then
    echo "curl is not found!"
	exit 1
fi

# Check if user entered arguments
if [ $# -lt 1 ] ; then
	echo -n "Enter the URL : "
	read url
else
	url=$1
fi

$("$BIN_PATH" -C - -L -O ${url})