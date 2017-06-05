#!/bin/bash
set -e

APP_NAME=eureka-discovery
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
lavkesh/eureka_discovery_server:$1