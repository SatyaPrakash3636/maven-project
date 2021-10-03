#! /bin/bash

export IMAGE=$(sed -n '1p' /home/prod-user/.auth)
export TAG=$(sed -n '2p' /home/prod-user/.auth)
export DOC_USR=$(sed -n '3p' /home/prod-user/.auth)
export DOC_PASS=$(sed -n '4p' /home/prod-user/.auth)
NEXUS_URL="localhost:8123"
docker login -u $DOC_USR -p $DOC_PASS 192.168.1.102:8123
docker pull $NEXUS_URL/$IMAGE:$BUILD_TAG
docker-compose up -d
