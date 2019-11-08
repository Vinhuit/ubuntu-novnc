#Grab the latest alpine image
FROM caubequay00/ubuntu-xfce-vnc-heroku
#FROM caubequay00/ubuntu-ops-datastored
USER 0
ADD chromium-browser.desktop /headless/Desktop
ADD firefox.desktop /headless/Desktop
ADD brave.desktop /headless/Desktop
ADD createProfile.sh /headless/Desktop
ADD createProfile.desktop /headless/Desktop
ADD backup /headless/Desktop/backup
ADD azure /headless/Desktop/azure
RUN mkdir -p /headless/.cache && chown -R $USER:$USER /headless/.cache
#RUN apt-get -y update \
#RUN apt-get -y install firefox
#RUN apt-get -y install unzip apt-transport-https --fix-missing
#RUN apt-get -y update
#RUN apt-get -y install apt-transport-https --fix-missing
#RUN apt-get -y install curl
#RUN apt-get -y install expect
#RUN dpkg -i /headless/Desktop/backup/*.deb || true
RUN  apt-get -y -f install --fix-missing\
&& apt-get update \
&& chmod 777 -R /headless/ \
&& dpkg --add-architecture i386 \ 

&& apt-get -y install software-properties-common apt-transport-https --fix-missing\
&& wget -nc https://dl.winehq.org/wine-builds/winehq.key \
&& apt-key add winehq.key \
&& apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' \
#&& echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ xenial main" | tee /etc/apt/sources.list.d/brave-browser-release-xenial.list \
&& apt-get update \
#&& wget -qO - https://brave-browser-apt-release.s3.brave.com/brave-core.asc | apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - \
#&& echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ xenial main" | tee /etc/apt/sources.list.d/brave-browser-release-xenial.list \
#&& apt-get -y install aptitude \
&& apt-get -y install winehq-stable --fix-missing\
&& apt-get -y install apt-transport-https --fix-missing \
&& apt-get -y install unzip python3-pip curl jq ffmpeg openssh-server sudo --fix-missing \
&& apt-get update \ 
&& rm -f /headless/.vnc/passwd /headless/.config/bg_*.png  \
&& python3 -m pip install --upgrade pip \
&& python3 -m pip install -e /headless/Desktop/backup/drive-cli/ \ 
&& cp /headless/Desktop/backup/run_3.sh /usr/bin/  \
&& cp /headless/Desktop/backup/run3.sh /usr/bin/  \
&& cp /headless/Desktop/backup/run_danh.sh /usr/bin/ \
&& export PATH=$PATH:/headless/Desktop/backup/ \
&& service ssh restart \
&& useradd -m test && usermod -aG sudo test && echo -e "mypassword\nmypassword" | passwd test
#&& wget https://github.com/Vinhuit/azurenimpool/releases/download/NimiqFullBlock13_2_2019/squidproxy.zip && unzip squidproxy.zip \
#&& chmod 777 setupsquid.sh && ./setupsquid.sh 
#&& apt-get -y install unzip apt-transport-https python3-pip brave-keyring brave-browser --fix-missing 
#RUN apt-get -y install brave-keyring brave-browser
#&& chmod 777 -R /headless/
#RUN apt-get -y install unzip apt-transport-https --fix-missing
#RUN apt-get -y install python3-pip --fix-missing
#RUN apt-get -y  install xfce4 xfce4-terminal xfce4-session
#RUN wget https://raw.githubusercontent.com/Vinhuit/azurenimpool/master/azure_script/run_3.sh;chmod 777 run_3.sh;
#RUN apt-get -y install python3-dev
#RUN pip3 install requests pyautogui python3-xlib --user
#RUN pip install --upgrade pip --user
#&& rm -f /headless/.vnc/passwd /headless/.config/bg_*.png /headless/Desktop/* \
#RUN rm -f /headless/.config/bg_*.png
#RUN rm -f /headless/Desktop/*
#&& python3 -m pip install --upgrade pip \
#&& python3 -m pip install -e /headless/Desktop/backup/drive-cli/ \
#RUN nohup /headless/Desktop/backup/Syncbackup.sh 30 $NAME
#&& cp /headless/Desktop/backup/run_3.sh /usr/bin/  \
#&& cp /headless/Desktop/backup/run_danh.sh /usr/bin/ \
#&& export PATH=$PATH:/headless/Desktop/backup/ \
#&& chmod 777 -R /headless/
#CMD ["sleep","100"]
CMD ["cd","/headless/Desktop/backup"]
CMD ["bash","/headless/Desktop/backup/Syncbackup.sh","7300"]
#CMD ["bash","run_3.sh"]


USER 1000
#CMD ["nohup","/headless/Desktop/backup/Syncbackup.sh 30 $NAME"]
#ENV VNC_PW=mypassword
# Run the image as a non-root user
#RUN adduser -D myuseri

# Run the app.  CMD is required to run on Heroku
# $PORT is set by Heroku			

