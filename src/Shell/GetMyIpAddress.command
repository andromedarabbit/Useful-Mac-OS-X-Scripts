#!/usr/bin/env bash
BIN_PATH=`which curl`
if [ -z "$BIN_PATH" ]; then
    echo "curl is not found!"
	exit 1
fi

# get an address of this computer by connecting to the website 'ifconfig.me'.
# the switch '--silent' diables the progress meter of curl.
MyIPAddress=$("$BIN_PATH" --silent ifconfig.me)

# copy the value to the clipboard
echo $MyIPAddress | pbcopy

# print the value
echo $MyIPAddress