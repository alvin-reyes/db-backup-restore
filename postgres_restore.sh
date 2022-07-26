#!/bin/sh

# get username
if [ -z $1 ]; then
    echo "Enter the username:"
    read USERNAME
else
    USERNAME=$1
fi

# get new database name
if [ -z $2 ]; then
    echo "Enter the new database name:"
    read DBNAME
else
    DBNAME=$2
fi

# get schema file name
if [ -z $3 ]; then
    echo "Enter the schema file name:"
    read SCHEMA
else
    SCHEMA=$3
fi

# get data file name
if [ -z $4 ]; then
    echo "Enter the data file name:"
    read DATA
else
    DATA=$4
fi

echo "drop database $DBNAME;" | psql --username=$USERNAME template1
echo "create database $DBNAME with encoding 'utf8';" | psql --username=$USERNAME template1

psql --username=$USERNAME $DBNAME < $SCHEMA
psql --username=$USERNAME $DBNAME < $DATA
