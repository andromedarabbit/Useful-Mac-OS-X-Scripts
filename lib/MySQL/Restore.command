#!/usr/bin/env bash 

source ./Info.sh

# Check if mysql exists
BIN_PATH=`which mysql`
if [ -z "BIN_PATH" ]; then
    echo "mysql is not found!"
	exit 1
fi

# Check if user entered arguments
if [ $# -lt 2] ; then
	echo -n "Enter the source sql file path: "
	read SOURCE_FILEPATH
	
	echo -n "Enter the target database name: "
	read DATABASE_NAME
else
	SOURCE_FILEPATH=$1
	DATABASE_NAME=$2
fi

"$BIN_PATH" -h "$HOST_NAME" -u "$MYSQL_USER" --password="$MYSQL_PASSWORD" -e "drop database IF EXISTS $DATABASE_NAME;" "mysql"

"$BIN_PATH" -h "$HOST_NAME" -u "$MYSQL_USER" --password="$MYSQL_PASSWORD" -e "create database IF NOT EXISTS $DATABASE_NAME;" "mysql"

"$BIN_PATH" -h "$HOST_NAME" -u "$MYSQL_USER" --password="$MYSQL_PASSWORD" "$DATABASE_NAME" < "$SOURCE_FILEPATH"