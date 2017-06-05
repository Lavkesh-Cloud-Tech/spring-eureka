#!/bin/bash
set -e

echo "======================== Start build eureka-server ====================="
./gradlew clean build

echo "======================== Delete old image if exist ======================="
IMAGE_ID=$(docker images -f "reference=*/*eureka_discovery*:$1" -q)
if [[ $IMAGE_ID != "" ]]; then
    echo "Deleting old image -> $IMAGE_ID"
    docker rmi $IMAGE_ID
fi

echo "======================== Start build image ======================="
docker build -t lavkesh/eureka_discovery_server:$1 .
echo "Image build => lavkesh/eureka_discovery_server:$1"