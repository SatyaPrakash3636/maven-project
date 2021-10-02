#! /bin/bash

echo "************************************************"
echo "****** Deploying Docker Image to Remote ********"
echo "************************************************"

echo mavan-project > ./.auth
echo $BUILD_TAG >> ./.auth
echo $DOCKER_USER >> ./.auth
echo $DOCKER_PASS >> ./.auth

scp -i prodcert .auth prod_user@13.233.247.108:/home/prod-user/.auth
scp -i prodcert remote-deploy.sh prod_user@13.233.247.108:/home/prod-user/remote-deploy.sh
ssh -i prodcert prod_user@13.233.247.108 /home/prod-user/remote-deploy.sh

