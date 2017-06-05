#!/bin/bash
set -e

APP_NAME=eureka-discovery
APP_VERSION=$1
DOCKER_MACHINE=${2:-192.168.99.100}
echo "$APP_NAME"
CONTAINER_ID=$(docker ps -a -f name="$APP_NAME" -q)

if [[ $? -eq 0 ]]; then
   if [[ $CONTAINER_ID != "" ]]; then
    echo "Removing CONTAINER_ID  =>  $CONTAINER_ID"
    docker stop $CONTAINER_ID
    docker rm -f $CONTAINER_ID
   fi
else
  #Fail
  echo "'docker ps -a -f name=$APP_NAME -q' command not run successfully!"
  exit 1
fi

docker run -d --hostname $APP_NAME --name $APP_NAME \
-p 8761:8080 \
-e SPRING_PROFILES_ACTIVE=dev \
-e DISCOVERY_USERNAME=eureka-user \
-e DISCOVERY_PASSWORD=password \
-e DOCKER_MACHINE=$DOCKER_MACHINE \
lavkesh/eureka_discovery_server:$APP_VERSION