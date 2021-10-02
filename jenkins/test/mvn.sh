#! /bin/bash

echo "**************************************"
echo "****** Testing Application Jar *******"
echo "**************************************"
 
docker run --rm -v /home/jenkins/jenkins-data/pipeline/java-app:/app -v /root/.m2:/root/.m2 -w /app maven:3.8.2-jdk-11 "$@"
