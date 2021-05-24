#!/usr/bin/env bash

# use `vagrant ssh m1` if contexts aren't setup, it's the same thing
docker -c m1 \
  container run -d \
  -p "8080:8080/tcp" \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  dockersamples/visualizer





## Notes
# - I am manually placing this on a manager node so placement can be discussed later also b/c it is put on the first node before it is converted to a swarm so we can see a first node added! 
# - its a standalone container so side by side with swarm objects/resources
# - what happens if my machine is restarted?
# - to locate UI I can only go to m1 (will this remain the same with the cluster? ;) )
