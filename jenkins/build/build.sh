#! /bin/bash

echo "**************************************"
echo "******* Building Docker Image ********"
echo "**************************************"

cp -f /home/jenkins/jenkins-data/pipeline/java-app/target/*.jar /home/jenkins/jenkins-data/pipeline/jenkins/build/

# Building Docker image

docker-compose -f /home/jenkins/jenkins-data/pipeline/jenkins/build/docker-compose-build.yml build --no-cache

rm -f /home/jenkins/jenkins-data/pipeline/jenkins/build/*.jar 
