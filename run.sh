#!/bin/bash

SHAKEDIR=/home/realtime/shakemaps
SFTP_IMAGE=docker-realtime-sftp

docker kill ${SFTP_IMAGE}
docker rm ${SFTP_IMAGE}

mkdir -p $SHAKEDIR
docker run --name="${SFTP_IMAGE}" \
	-v $SHAKEDIR:$SHAKEDIR \
	-p 9222:22 \
	-d -t aifdr/${SFTP_IMAGE}

echo "You can copy files into this container with these credentials:"
docker cp ${SFTP_IMAGE}:/credentials .
cat credentials
rm credentials
