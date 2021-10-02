#! /bin/bash

echo "**************************************"
echo "******* Building Docker Image ********"
echo "**************************************"

cp -f ./java-app/target/*.jar ./jenkins/build/

# Building Docker image

docker-compose -f ./jenkins/build/docker-compose-build.yml build --no-cache

rm -f ./jenkins/build/*.jar 
