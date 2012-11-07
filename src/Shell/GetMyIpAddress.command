#!/usr/bin/env bash
CURLPATH=`which curl`
if [ -z "$CURLPATH" ]; then
    echo "curl is not found!"
	exit 1
fi
"$CURLPATH" ifconfig.me