#! /bin/bash

echo "**************************************"
echo "******* Pushing Docker Image *********"
echo "**************************************"

IMAGE="maven-project"
echo
echo "******** Login to Docker Hub *********"
echo
docker login -u $DOCKER_USER -p $DOCKER_PASS
echo

echo "******* Tagging to Docker Hub ********"
echo
docker tag $IMAGE:$BUILD_TAG $DOCKER_USER/$IMAGE:$BUILD_TAG
echo
echo "******** Pushing to Docker Hub *******"
echo
docker push $DOCKER_USER/$IMAGE:$BUILD_TAG
