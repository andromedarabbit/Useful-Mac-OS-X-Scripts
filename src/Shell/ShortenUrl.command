#!/usr/bin/env bash
 
#  This script is used to shorten the long url
#  Author  : Kamaraj Subramanian
#  Website : www.thelinuxtips.com
#  Ref: http://tinyurl.com/c4adpu7
 
echo -n "Enter the URL : "
read url

short_url=$(curl -C - -L -O ${url})
 
short_url=$(curl -s http://tinyurl.com/api-create.php?url=${url})

# copy the shortened url to the clipboard
echo ${short_url} | pbcopy 

# print the url
echo "Short URL is : ${short_url}"