#!/bin/bash
set -e

IMAGE_NAME=lavkesh/eureka_registry_server
IMAGE_VERSION=$1

echo "======================== Start build eureka-server ====================="
./gradlew clean build

echo "======================== Start build image ======================="
docker build -t $IMAGE_NAME:$IMAGE_VERSION .
echo "Image build => $IMAGE_NAME:$IMAGE_VERSION"