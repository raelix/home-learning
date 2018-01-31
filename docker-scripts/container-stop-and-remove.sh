#!/bin/sh

echo ""
echo "Stopping containers"
docker stop engine engine_db

echo ""
echo "Removing containers"
docker rm engine engine_db

echo ""
echo "-------------------"

echo ""
echo "containers:"
docker ps -a
echo ""

echo ""
echo "images:"
docker images
