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
echo

echo "******* Tagging to Docker Image ********"
echo
docker tag $IMAGE:$BUILD_TAG $NEXUS_URL/$IMAGE:$BUILD_TAG
echo
echo "******** Pushing to Nexus Repo *******"
echo
docker push $NEXUS_URL/$IMAGE:$BUILD_TAG
