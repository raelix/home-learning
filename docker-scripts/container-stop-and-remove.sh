#!/bin/sh

name=$(cat ../docker-compose.yml  | grep container_name | cut -d ":" -f "2" )

for container in $name; do
 echo ""
 echo "Stopping container $container..."
 docker stop "$container"
 echho "Removing container $container..."
 docker rm "$container"
done

echo "-------------------"

echo ""
echo "containers:"
docker ps -a
echo ""

echo ""
echo "images:"
docker images
