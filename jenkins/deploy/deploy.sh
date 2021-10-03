#! /bin/bash

echo "************************************************"
echo "****** Deploying Docker Image to Remote ********"
echo "************************************************"

DOCKER_USER=admin
echo mavan-project > ./.auth
echo $BUILD_TAG >> ./.auth
echo $DOCKER_USER >> ./.auth
echo $DOCKER_PASS >> ./.auth
chmod 400 jenkins/deploy/prodcert
/usr/bin/scp -i jenkins/deploy/prodcert .auth remote_user@prod_host:/tmp/.auth
/usr/bin/scp -i jenkins/deploy/prodcert remote-deploy.sh remote_user@prod_host:/tmp/remote-deploy.sh
/usr/bin/ssh -i jenkins/deploy/prodcert remote_user@prod_host /tmp/remote-deploy.sh

