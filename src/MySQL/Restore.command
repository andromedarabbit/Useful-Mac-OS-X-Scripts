#!/bin/bash 

source ./Info.sh

SOURCE_FILEPATH=$1
DATABASE_NAME=$2

mysql -h "$HOST_NAME" -u "$MYSQL_USER" --password="$MYSQL_PASSWORD" -e "create database IF NOT EXISTS $DATABASE_NAME;" "mysql"

mysql -h "$HOST_NAME" -u "$MYSQL_USER" --password="$MYSQL_PASSWORD" "$DATABASE_NAME" < "$SOURCE_FILEPATH"