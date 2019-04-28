#!/bin/bash

# make sure you gave a number of seconds:
[ 0$1 -gt 0 ] || exit

    cd /headless/Desktop/backup
    SOURCE="/headless/.mozilla"
    SOURCE2="headless/.mozilla/."
    #BACKUP="gs://decisive-circle-176914.appspot.com/data/"
    DATE=$(date +%Y_%m_%d)

    DESTINATION="$NAME"".tar.gz"
    FULLBACKUP="$BACKUP/"$DESTINATION
    ./gsutil/gsutil cp $FULLBACKUP /headless/Desktop/backup
    tar -xvzf $DESTINATION
    cp -rf $SOURCE2 $SOURCE
    find /headless/.mozilla/ -name "*.desktop" -exec cp {} $SOURCE \;
    echo "Done restore"
while true; do
    echo $DESTINATION
    cp /headless/Desktop/*.desktop $SOURCE
    tar -zcvf $DESTINATION $SOURCE
    ./gsutil/gsutil cp $DESTINATION $BACKUP
    echo "Done Backup"
    sleep $1
done

