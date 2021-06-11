#!/usr/bin/env bash

docker service create \
  --name weby \
  --publish 8200:80 \
  nginx 
