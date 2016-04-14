FROM debian:jessie
MAINTAINER Florian Bigard <florian.bigard@gmail.com>

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install mongodb openssl xvfb curl sudo git build-essential libgtk2.0-0 libgconf-2-4 libnss3 libasound2 libxtst6 libxss1 libnotify-bin
RUN apt-get clean

RUN mkdir -p /data/db

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo bash -
RUN apt-get -y install -y nodejs
RUN npm install -g electron-prebuilt

RUN useradd -m -d /home/peertube_user -s /bin/bash -p peertube_user peertube_user

WORKDIR /home/peertube_user

ADD peertube_start.sh /home/peertube_user/peertube_start.sh
RUN chown peertube_user /home/peertube_user/peertube_start.sh
RUN chmod +x /home/peertube_user/peertube_start.sh

USER peertube_user

RUN git clone https://github.com/Chocobozzz/PeerTube
WORKDIR PeerTube
RUN npm install
RUN npm run build

USER root

EXPOSE 9000

ENTRYPOINT ["/home/peertube_user/peertube_start.sh"]
