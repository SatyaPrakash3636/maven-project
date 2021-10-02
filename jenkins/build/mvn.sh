#! /bin/bash

echo "**************************************"
echo "***** Building Application Jar *******"
echo "**************************************"

WORKSPACE=/home/jenkins/jenkins-data/jenkins_home/workspace/pipeline/maven-remote
 
docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2:/root/.m2 -w /app maven:3.8.2-jdk-11 "$@"
