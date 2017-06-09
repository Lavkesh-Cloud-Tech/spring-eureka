#!/bin/bash
set -e

IMAGE_NAME=lavkesh/eureka_registry_server
IMAGE_VERSION=$1
NETWORK_NAME=my-bridge
CONTAINER_NAME=${2:-registry-server}
echo "CONTAINER NAME => $CONTAINER_NAME"
echo "NETWORK NAME => $NETWORK_NAME"

echo "======================== Stop $CONTAINER_NAME container if exist ======================="
CONTAINER_ID=$(docker ps -a -f name="$CONTAINER_NAME" -q)
if [[ $CONTAINER_ID != "" ]]; then
  echo "Removing CONTAINER_ID  =>  $CONTAINER_ID"
  docker stop $CONTAINER_ID
  docker rm -f $CONTAINER_ID
fi

echo "======================== Starting container => $CONTAINER_NAME ======================="
docker run -d --name $CONTAINER_NAME \
--network=$NETWORK_NAME -p 8761:8080 \
-e SPRING_PROFILES_ACTIVE=dev \
-e REGISTRY_USERNAME=eureka-user -e REGISTRY_PASSWORD=password \
$IMAGE_NAME:$IMAGE_VERSION