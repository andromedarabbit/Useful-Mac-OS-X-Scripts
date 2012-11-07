#!/usr/bin/env bash 
THIS_DIR=`dirname $0`

source "$THIS_DIR/Info.sh"

# Check if mysqldump exists
BIN_PATH=`which mysqldump`
if [ -z "BIN_PATH" ]; then
    echo "mysqldump is not found!"
	exit 1
fi

# Check if user entered arguments
if [ $# -lt 1 ] ; then
	echo -n "Enter the target file path : "
	read TARGET_FILEPATH
else
	TARGET_FILEPATH=$1
fi

"$BIN_PATH" -h "$HOST_NAME" -u "$MYSQL_USER" --password="$MYSQL_PASSWORD" "$DATABASE_NAME" --add-drop-database --add-locks --comments --skip-compact --create-options --default-character-set=utf8 --disable-keys --skip-dump-date --skip-extended-insert --lock-tables --quick --quote-names --routines --set-charset --triggers --result-file="$TARGET_FILEPATH"