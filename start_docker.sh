#!/bin/bash

D=$(docker run -d -v `pwd`:/home/gyazo/import -p 8081:80 s3gyazo)
sleep 5
docker logs $D
docker ps

