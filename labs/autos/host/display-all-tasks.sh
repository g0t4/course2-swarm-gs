#!/usr/bin/env bash

echo '## all tasks:' 
docker service ps \
  --format "table {{.Name}}\t{{.Node}}\t{{.DesiredState}}\t{{.CurrentState}}\t{{.Error}}" \
  $(docker service ls -q)
