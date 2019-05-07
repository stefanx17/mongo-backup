#!/bin/bash

DATABASE=$1
BACKUPDIR=backups
BACKUP=$2
TAR=`which tar`
TMP=$BACKUPDIR/tmp

if [ ! -d $TMP ];
then
    mkdir $TMP
fi

# decompress backup
tar -xzf $BACKUP -C $TMP

# restore data to a new database
mongorestore --db $DATABASE $TMP/$(ls $TMP | head -n 1)

# cleanup
rm -rf $TMP
