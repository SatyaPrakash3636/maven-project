#! /bin/bash

export IMAGE=$(sed -n '1p' /home/prod-user/.auth)
export TAG=$(sed -n '2p' /home/prod-user/.auth)
export DOC_USR=$(sed -n '3p' /home/prod-user/.auth)
export DOC_PASS=$(sed -n '4p' /home/prod-user/.auth)

docker login -u $DOC_USR -p $DOC_PASS
docker-compose up -d
