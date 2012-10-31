#!/usr/bin/env bash
 
# This script is used to download a file from the target url.
# Resume a failed download.
 
echo -n "Enter the URL : "
read url
 
$(curl -C - -L -O ${url})