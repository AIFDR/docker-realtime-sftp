#!/bin/bash

SHAKEDIR=/home/realtime/shakemaps
mkdir -p $SHAKEDIR
docker.io run --name='inasafe-realtime-sftp' \
	-v $SHAKEDIR:/shakemaps \
	-p 9222:22 \
	-d -t AIFDR/sftp-realtime

