#!/usr/bin/env zsh

for t in $(docker service ps ab-slow -q); do
  echo '\n\n################\n\n' 
  docker service logs $t
done
