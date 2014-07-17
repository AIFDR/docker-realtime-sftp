#!/bin/bash

docker.io run --name='sftp-realtime' \
-v /home/realtime/shakemaps:/shakemaps \
-p 22:22 \
-d -t AIFDR/sftp-realtime
