#!/usr/bin/env bash
PS3='Please enter your choice: '

options=("Indefinitely" "5 minutes" "10 minutes" "15 minutes" "30 minutes" "1 hour" "2 hours" "5 hours")

minutes=0

select opt in "${options[@]}"
do
	case $opt in
		"Indefinitely")
			break
			;;
		"5 minutes")
			minutes=5
			break
			;;
		"10 minutes")
			minutes=10
			break
			;;
		"15 minutes")
			minutes=15
			break
			;;
		"30 minutes")
			minutes=30
			break
			;;
		"1 hour")
			minutes=(1 * 60)
			break
			;;
		"2 hours")
			minutes=(2 * 60)
			break
			;;
		"5 hours")
			minutes=(5 * 60)
			break
			;;
		*) echo invalid option;;
	esac
done


("systemsetup" -setcomputersleep 5)

THIS_DIR=`dirname $0`
("$THIS_DIR/Kill.command" caffeinate)

if [ ${minutes} -eq 0 ] ; then
	echo "Never allow the computer to sleep."
	("systemsetup" -setcomputersleep "Never")
else
	
	
	echo "Prevent the computer from sleeping from " ${minutes} " minutes."
	("nohup" caffeinate -t ${minutes}) &
fi
	
