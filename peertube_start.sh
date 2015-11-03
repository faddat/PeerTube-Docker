#!/bin/bash

/usr/bin/mongod &
sleep 100
cd /root/PeerTube && grunt build && node server.js
