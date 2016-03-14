# PeerTube-Docker

[![Build Status](https://travis-ci.org/Chocobozzz/PeerTube-Docker.svg?branch=master)](https://travis-ci.org/Chocobozzz/PeerTube-Docker)

Dockerfile for [PeerTube](https://github.com/Chocobozzz/PeerTube).

## Usage

Build the image:

    $ git clone https://github.com/Chocobozzz/PeerTube-Docker
    $ cd PeerTube-Docker
    # docker build -t yourname/peertube .

Run the image:

    # docker run --publish=9000:9000 yourname/peertube

Once the server is listening, you can test it at http://localhost:9000.
