#!/usr/bin/env bash

## Create a service by hand

docker service create \
  --name=viz \
  --publish=8081:8080/tcp \
  --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  dockersamples/visualizer

docker service update \
  --constraint-add node.role==manager \
  viz









## Watching the viz service with a custom column format:
watch -t -d -n 0.5 'docker service ps --format "table {{.ID}}\t{{.Name}}\t{{.Node}}\t{{.DesiredState}}\t{{.CurrentState}}" viz'
