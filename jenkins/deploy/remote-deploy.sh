#! /bin/bash

export IMAGE=$(sed -n '1p' /tmp/.auth)
export BUILD_TAG=$(sed -n '2p' /tmp/.auth)
export DOC_USR=$(sed -n '3p' /tmp/.auth)
export DOC_PASS=$(sed -n '4p' /tmp/.auth)
export NEXUS_URL="localhost:8123"
docker login -u $DOC_USR -p $DOC_PASS $NEXUS_URL
docker pull $IMAGE:$BUILD_TAG
cd && docker-compose up -d
