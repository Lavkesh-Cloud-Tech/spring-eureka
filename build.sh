#!/bin/bash
set -e

echo "======================== Start build eureka-server ====================="
./gradlew clean build

echo "======================== Delete old image if exist ======================="
IMAGE_ID=$(docker images -f "reference=*/*eureka_discovery*:$1" -q)
if [[ $IMAGE_ID != "" ]]; then

    RUNNING_CONTAINER_ID=$(docker ps -a -f "name=eureka-discovery" -q)
    if [[ $RUNNING_CONTAINER_ID != "" ]]; then
        echo "Stopping RUNNING_CONTAINER_ID  =>  $CONTAINER_ID"
        docker stop $RUNNING_CONTAINER_ID
        docker rm -f $RUNNING_CONTAINER_ID
    fi

    echo "Deleting old image -> $IMAGE_ID"
    docker rmi -f $IMAGE_ID
fi

echo "======================== Start build image ======================="
docker build -t lavkesh/eureka_discovery_server:$1 .
echo "Image build => lavkesh/eureka_discovery_server:$1"