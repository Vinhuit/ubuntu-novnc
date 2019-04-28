#Grab the latest alpine image
FROM caubequay00/ubuntu-xfce-vnc-heroku
USER 0
RUN rm -f /headless/.vnc/passwd 
RUN rm -f /headless/.config/bg_*.png
RUN rm -f /headless/Desktop/*
ADD chromium-browser.desktop /headless/Desktop
ADD firefox.desktop /headless/Desktop
ADD createProfile.sh /headless/Desktop
ADD createProfile.desktop /headless/Desktop
ADD backup /headless/Desktop/backup
ADD Procfile /headless
RUN chmod 777 /headless/Desktop/createProfile.sh
#RUN nohup /headless/Desktop/backup/Syncbackup.sh 30 $NAME
RUN export PATH=$PATH:/headless/Desktop/backup/
CMD ["cd","/headless/Desktop/backup"]
CMD ["bash","/headless/Desktop/backup/Syncbackup.sh","300"]


USER 1000
#CMD ["nohup","/headless/Desktop/backup/Syncbackup.sh 30 $NAME"]
#ENV VNC_PW=mypassword
# Run the image as a non-root user
#RUN adduser -D myuseri

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			

