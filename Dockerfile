FROM debian:jessie
MAINTAINER Florian Bigard <florian.bigard@gmail.com>

RUN echo "deb http://ftp.debian.org/debian jessie-backports main contrib non-free" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install ffmpeg mongodb openssl sudo curl git build-essential
RUN apt-get clean

RUN mkdir -p /data/db

RUN curl -sL https://deb.nodesource.com/setup_7.x | sudo bash -
RUN apt-get -y install -y nodejs

RUN useradd -m -d /home/peertube_user -s /bin/bash -p peertube_user peertube_user

WORKDIR /home/peertube_user

ADD peertube_start.sh /home/peertube_user/peertube_start.sh
RUN chown peertube_user /home/peertube_user/peertube_start.sh
RUN chmod +x /home/peertube_user/peertube_start.sh

USER peertube_user

RUN git clone https://github.com/faddat/PeerTube -b beyondbitcoin
WORKDIR PeerTube
RUN npm install
RUN npm run build

USER root

EXPOSE 9000

ENTRYPOINT ["/home/peertube_user/peertube_start.sh"]
