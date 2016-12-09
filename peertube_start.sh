#!/bin/bash

/usr/bin/mongod &
sleep 10
cd /home/peertube_user/PeerTube && su peertube_user -c 'npm run build && npm start'
