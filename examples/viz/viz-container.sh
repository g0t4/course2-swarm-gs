#!/usr/bin/env bash

# use `vagrant ssh m1` if contexts aren't setup, it's the same thing
docker -c m1 \
  container run -d \
  -p "8080:8080/tcp" \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  dockersamples/visualizer

# Notes
# - I am manually placing this on a manager node
# - its a standalone container so side by side with swarm objects/resources
# - this will remain familiar
# - to locate UI I can only go to m1 (will this remain the same with the cluster? ;) )
