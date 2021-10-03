#! /bin/bash

echo "************************************************"
echo "****** Deploying Docker Image to Remote ********"
echo "************************************************"

DOCKER_USER=admin
echo mavan-project > jenkins/deploy/.auth
echo $BUILD_TAG >> jenkins/deploy/.auth
echo $DOCKER_USER >> jenkins/deploy/.auth
echo $DOCKER_PASS >> jenkins/deploy/.auth
chmod 400 jenkins/deploy/prodcert
/usr/bin/scp -i jenkins/deploy/prodcert jenkins/deploy/.auth remote_user@prod_host:/tmp/.auth
/usr/bin/scp -i jenkins/deploy/prodcert jenkins/deploy/remote-deploy.sh remote_user@prod_host:/tmp/remote-deploy.sh
/usr/bin/ssh -i jenkins/deploy/prodcert remote_user@prod_host /tmp/remote-deploy.sh

