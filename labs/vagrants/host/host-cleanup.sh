#!/usr/bin/env bash

trash ~/.ssh/config.d/vagrant_swarmgs 

docker context use default # can't nuke a context being used so switch to default
for vm in $(vagrant status --machine-readable | cut -d',' -f2 | sort | uniq); do 
  docker context rm "$vm"
done

