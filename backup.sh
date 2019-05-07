#!/bin/bash

DATABASE=$1
BACKUPDIR=backups
BACKUP=$1-backup
TAR=`which tar`

if [ ! -d $BACKUPDIR ];
    then
    mkdir $BACKUPDIR
fi

# get a dump of the databse
mongodump --db $DATABASE --out $BACKUPDIR

# compress the backup
$TAR -czf $BACKUPDIR/$BACKUP.tar.gz -C $BACKUPDIR $DATABASE .

# clean the uncompressed files
rm -rf $BACKUPDIR/$DATABASE
