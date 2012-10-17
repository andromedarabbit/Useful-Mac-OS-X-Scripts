#!/bin/bash 
THIS_DIR=`dirname $0`

source "$THIS_DIR/Info.sh"

TARGET_FILEPATH=$1

mysqldump -h "$HOST_NAME" -u "$MYSQL_USER" --password="$MYSQL_PASSWORD" "$DATABASE_NAME" --add-drop-database --add-locks --comments --skip-compact --create-options --default-character-set=utf8 --disable-keys --skip-dump-date --skip-extended-insert --lock-tables --quick --quote-names --routines --set-charset --triggers --result-file="$TARGET_FILEPATH"