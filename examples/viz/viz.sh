#!/usr/bin/env bash

## Create a service by hand

docker service create \
  --name=viz_dsc \
  --publish=8080:8080/tcp \
  --constraint=node.role==manager \
  --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  dockersamples/visualizer


## Stack approach

docker stack deploy -c viz.yml
