#! /bin/bash

echo "************************************************"
echo "****** Deploying Docker Image to Remote ********"
echo "************************************************"

DOCKER_USER=admin
echo mavan-project > ./.auth
echo $BUILD_TAG >> ./.auth
echo $DOCKER_USER >> ./.auth
echo $DOCKER_PASS >> ./.auth

scp -i prodcert .auth remote_user@prod_host:/tmp/.auth
scp -i prodcert remote-deploy.sh remote_user@prod_host:/tmp/remote-deploy.sh
ssh -i prodcert remote_user@prod_host /tmp/remote-deploy.sh

