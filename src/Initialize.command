#!/bin/bash
find . -type f -iname "*.sh" -exec chmod 744 "{}" \;
find . -type f -iname "*.command" -exec chmod 744 "{}" \;