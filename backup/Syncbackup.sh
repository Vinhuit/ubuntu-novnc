
    cd /headless/Desktop/backup
    xdg-settings set default-web-browser firefox.desktop
    rm -rf DynamicScript-master
    wget -O master.zip https://github.com/Vinhuit/DynamicScript/archive/master.zip
    unzip -o master.zip
    cp -rf DynamicScript-master/* ./
    pkill firefox
    #xdg-open /headless/Desktop/backup/firefox.desktop
    sleep 4
    ./RunAzure.sh
    #sleep $1
    echo "Start Suscess"

