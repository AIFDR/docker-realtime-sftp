#!/bin/bash

SHAKEDIR=/home/realtime/shakemaps

docker.io kill inasafe-realtime-sftp
docker.io rm inasafe-realtime-sftp

mkdir -p $SHAKEDIR
docker.io run --name='inasafe-realtime-sftp' \
	-v $SHAKEDIR:/shakemaps \
	-p 9222:22 \
	-d -t AIFDR/sftp-realtime

echo "You can copy files into this container with these credentials:"
docker.io cp inasafe-realtime-sftp:/credentials .
cat credentials
rm credentials


