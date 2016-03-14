FROM debian:jessie
MAINTAINER Florian Bigard <florian.bigard@gmail.com>

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install mongodb openssl xvfb curl sudo git build-essential libgtk2.0-0 libgconf-2-4 libnss3 libasound2 libxtst6 libxss1
RUN apt-get clean

RUN mkdir -p /data/db

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo bash -
RUN apt-get -y install -y nodejs
RUN npm install -g electron-prebuilt

WORKDIR /root

RUN git clone https://github.com/Chocobozzz/PeerTube
WORKDIR PeerTube
RUN npm install
RUN npm run build

ADD peertube_start.sh /usr/bin/peertube_start.sh
RUN chmod +x /usr/bin/peertube_start.sh

EXPOSE 9000

ENTRYPOINT ["/usr/bin/peertube_start.sh"]
