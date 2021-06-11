#!/usr/bin/env bash

docker container run \
  --name weby \
  --publish 8200:80 \
  nginx
