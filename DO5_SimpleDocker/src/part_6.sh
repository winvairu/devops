#!/bin/bash

running_containers=$(docker ps -q)

if [ -n "$running_containers" ]; then
  docker stop $running_containers
  echo "All containers are stopped."
else
  echo "There are no containers running."
fi

docker-compose build

docker-compose up
