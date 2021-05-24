#!/usr/bin/env bash

docker container run \
  --name plain-nginx \
  --publish 9080:80 \
  nginx
