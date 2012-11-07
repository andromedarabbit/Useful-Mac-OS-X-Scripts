#!/usr/bin/env bash
BIN_PATH=`which curl`
if [ -z "$BIN_PATH" ]; then
    echo "curl is not found!"
	exit 1
fi

# "$BIN_PATH" ifconfig.me
MyIPAddress=$("$BIN_PATH" --silent ifconfig.me)

# copy the value to the clipboard
echo $MyIPAddress | pbcopy

# print the value
echo $MyIPAddress