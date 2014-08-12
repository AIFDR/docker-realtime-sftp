#!/bin/bash

SHAKEDIR=/home/realtime/shakemaps
SFTP_IMAGE=docker-realtime-sftp

docker kill inasafe-realtime-sftp
docker rm inasafe-realtime-sftp

mkdir -p $SHAKEDIR
docker run --name='inasafe-realtime-sftp' \
	-v $SHAKEDIR:$SHAKEDIR \
	-p 9222:22 \
	-d -t aifdr/${SFTP_IMAGE}

echo "You can copy files into this container with these credentials:"
docker cp inasafe-realtime-sftp:/credentials .
cat credentials
rm credentials


