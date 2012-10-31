#!/usr/bin/env bash

# ref: https://www.scorec.rpi.edu/wiki/Safe_%27rm%27_command

# srm <directory>
# will mv all sub-directories and files of <directory> to the ~/.Trash . 

mkdir ~/.Trash &> /dev/null
while [ ! -z "$1" ]; do
	mv "$1" ~/.Trash/
	shift  #increment the loop variable
done