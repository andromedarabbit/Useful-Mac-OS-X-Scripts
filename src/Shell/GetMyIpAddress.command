#!/usr/bin/env bash
CURLPATH=`which curl`
if [ -z "$CURLPATH" ]; then
    echo "curl is not found!"
fi
"$CURLPATH" ifconfig.me