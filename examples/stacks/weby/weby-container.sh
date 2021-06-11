#!/usr/bin/env bash

docker container run \
  --name plain-nginx \
  --publish 8200:80 \
  nginx
