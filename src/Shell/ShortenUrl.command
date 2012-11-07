#!/usr/bin/env bash
 
#  This script is used to shorten the long url
#  Author  : Kamaraj Subramanian
#  Website : www.thelinuxtips.com
#  Ref: http://tinyurl.com/c4adpu7

# Check if curl exists
BIN_PATH=`which curl`
if [ -z "BIN_PATH" ]; then
    echo "curl is not found!"
	exit 1
fi

# Check if user entered arguments
if [ $# -lt 1 ] ; then
	echo -n "Enter the Long URL : "
	read url
else
	url=$1
fi

short_url=$("$BIN_PATH" -s http://tinyurl.com/api-create.php?url=${url})

# copy the shortened url to the clipboard
echo ${short_url} | pbcopy 

# print the url
echo "Short URL is : ${short_url}"