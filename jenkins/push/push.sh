#! /bin/bash

echo "**************************************"
echo "******* Pushing Docker Image *********"
echo "**************************************"

IMAGE="maven-project"
NEXUS_URL="localhost:8123"
echo
echo "******** Login to Nexus Repo *********"
echo
docker login -u admin -p $DOCKER_PASS $NEXUS_URL
docker push localhost:8123/maven-project:jenkins-pipeline-maven-remote-16
echo

echo "******* Tagging to Docker Hub ********"
echo
docker tag $IMAGE:$BUILD_TAG $NEXUS_URL/$IMAGE:$BUILD_TAG
echo
echo "******** Pushing to Docker Hub *******"
echo
docker push $NEXUS_URL/$IMAGE:$BUILD_TAG
