#!/bin/bash
cd /headless/Desktop
number=$RANDOM
echo $number
name='firefox'${number}
echo $name
mkdir /datafirefox/$name
RESULT=$?
if [ $RESULT -eq 0 ]; then
	echo "success create dir"
	cp firefox.desktop $name.desktop
	sed -i 's/datafirefox/datafirefox\/'$name'/' $name.desktop
	sed -i 's/Firefox Web Browser/Firefox Web Browser '$number'/' $name.desktop

else
	mkdir -p /headless/.mozilla/$name
	cp firefox.desktop $name.desktop
	sed -i 's/mozilla\/firefox/mozilla\/'$name'/' $name.desktop
	sed -i 's/Firefox Web Browser/Firefox Web Browser '$number'/' $name.desktop
fi

