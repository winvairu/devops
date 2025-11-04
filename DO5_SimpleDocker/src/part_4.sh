#!/bin/bash

docker build -t myserver:v1 .

image_id=$(docker images --format "{{.ID}}" --filter "reference=myserver:v1")

echo "Found IMAGE ID: $image_id"

docker run -d --name my_server -p 80:81 -v /Volumes/winvairu/cranbero/DO5_SimpleDocker-1/src/part_3/.nginx/nginx.conf:/etc/nginx/nginx.conf "$image_id"

docker ps
