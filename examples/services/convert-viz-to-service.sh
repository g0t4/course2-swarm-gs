#!/usr/bin/env bash

# First, we created viz as a standalone container, a great candidate for a first service!

## 1. Create a service "by hand"
# Note: something is missing intentionally

docker service create \
  --name=viz \
  --publish=8081:8080/tcp \
  --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  dockersamples/visualizer


## 2. Updating a service "by hand"

docker service update \
  --constraint-add node.role==manager \
  viz


## Watching for task changes to viz

# watches should be run in VM for performance 
#   or slow down frequency of checking (ie -n 2)
watch -t -d -n 0.5 'docker service ps --format "table {{.ID}}\t{{.Name}}\t{{.Node}}\t{{.DesiredState}}\t{{.CurrentState}}" viz'
# add/rm columns based on scenario
# here are the ones I left out: 
#   \t{{.Image}}\t{{.Error}}\t{{.Ports}}
# see all fields: 
#   --format "table"
# use json to find casing/spelling of fields:
#   --format "{{json .}}"


## viz Container logs

docker service logs viz 
