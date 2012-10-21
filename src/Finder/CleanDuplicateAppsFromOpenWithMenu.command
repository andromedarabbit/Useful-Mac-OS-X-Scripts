#!/bin/bash
# ref: https://www.evernote.com/shard/s5/sh/6986561a-47a6-4ead-935c-77efbf5de077/201fc151d39b4f554d2e9562e5cd34e8

/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user 

killall Finder