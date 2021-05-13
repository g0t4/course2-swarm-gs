#!/usr/bin/env bash

docker service create plain-nginx \
  --publish=9080:80/tcp \
  --replicas=1 \
  nginx 
