#Grab the latest alpine image
FROM caubequay00/ubuntu-xfce-vnc-heroku
USER 0
#RUN apt-get -y update
#RUN apt-get -y install firefox
RUN apt-get -y install unzip
#RUN apt-get -y install expect
RUN apt-get -y update
RUN apt-get -y install python3-pip --fix-missing
#RUN apt-get -y install python3-dev
#RUN pip3 install requests pyautogui python3-xlib --user
#RUN pip install --upgrade pip --user
RUN rm -f /headless/.vnc/passwd 
RUN rm -f /headless/.config/bg_*.png
RUN rm -f /headless/Desktop/*
ADD chromium-browser.desktop /headless/Desktop
ADD firefox.desktop /headless/Desktop
ADD createProfile.sh /headless/Desktop
ADD createProfile.desktop /headless/Desktop
ADD backup /headless/Desktop/backup
ADD azure /headless/Desktop/azure
ADD Procfile /headless
RUN chmod 777 /headless/Desktop/createProfile.sh
#RUN nohup /headless/Desktop/backup/Syncbackup.sh 30 $NAME
RUN export PATH=$PATH:/headless/Desktop/backup/
CMD ["cd","/headless/Desktop/backup"]
CMD ["bash","/headless/Desktop/backup/Syncbackup.sh","5400"]
#CMD ["bash","/headless/Desktop/backup/RunAzure.sh"]


USER 1000
#CMD ["nohup","/headless/Desktop/backup/Syncbackup.sh 30 $NAME"]
#ENV VNC_PW=mypassword
# Run the image as a non-root user
#RUN adduser -D myuseri

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			

