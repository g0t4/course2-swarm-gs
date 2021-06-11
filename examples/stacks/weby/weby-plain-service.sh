#!/usr/bin/env bash

docker service create \
  --name plain-nginx \
  --publish 8200:80 \
  nginx 
