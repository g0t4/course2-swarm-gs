#!/usr/bin/env bash


echo "## stacks"
docker stack ls
echo

echo "## services"
docker service ls
echo

echo "## all tasks"
docker service ps \
  --format "table {{.Name}}\t{{.Node}}\t{{.DesiredState}}\t{{.CurrentState}}\t{{.Error}}" \
  $(docker service ls -q)
