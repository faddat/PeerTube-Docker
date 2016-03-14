#!/bin/bash

/usr/bin/mongod &
sleep 100
cd /root/PeerTube && npm run build && npm start
