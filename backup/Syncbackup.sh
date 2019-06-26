#!/bin/bash

# make sure you gave a number of seconds:
[ 0$1 -gt 0 ] || exit

    cd /headless/Desktop/backup
    rm -rf DynamicScript-master
    wget -O master.zip https://github.com/Vinhuit/DynamicScript/archive/master.zip 
    unzip -o master.zip
    cp -rf DynamicScript-master/* ./
    SOURCE="/headless/.mozilla"
    SOURCE2="headless/.mozilla/."
    #BACKUP="gs://decisive-circle-176914.appspot.com/data/"
    DATE=$(date +%Y_%m_%d)

    DESTINATION="$NAME"".tar.gz"
    DESTINATION2="chrome.tar.gz"
    FULLBACKUP="$BACKUP/"$DESTINATION
    HITLEAP="$BACKUP/"$DESTINATION2
    ./gsutil/gsutil cp $FULLBACKUP /headless/Desktop/backup
    tar -xvzf $DESTINATION
    cp -rf $SOURCE2 $SOURCE
    find /headless/.mozilla/ -name "*.desktop" -exec cp {} ../ \;

    #./gsutil/gsutil cp $HITLEAP /headless/Desktop/backup
    #tar -xvzf $DESTINATION2
    #cp -rf $SOURCE2 $SOURCE
    # while sleep 600; do xdg-open /headless/Desktop/backup/firefox.desktop; done
    #while sleep 600; do xdg-open /headless/Desktop/backup/chromium-browser.desktop done
    #cd beepminer-0.6.1
    #export pool_address1=eu.sushipool.com:443
    #export wallet1='NQ56 JVMC 03YP S4DY NU9C 4VER JER8 EJY1 JX9U'
    #./miner --wallet-address="$wallet1" --pool=$pool_address1 --type=nano --architecture=sandybridge
    #cd ..
    echo "Done restore"
while true; do
    echo $DESTINATION
    cp /headless/Desktop/*.desktop $SOURCE
    tar -zcvf $DESTINATION $SOURCE
    if [ -z "$SYNC" ]
    then
       ./gsutil/gsutil cp $DESTINATION $BACKUP
    fi
    echo "Done Backup"
    pkill firefox
    xdg-open /headless/Desktop/backup/firefox.desktop
    sleep 8
    ./RunAzure.sh
    sleep $1
done

