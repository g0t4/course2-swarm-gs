#!/bin/bash

# provisioner to be run on m1

docker container run --detach \
  --publish "8080:8080/tcp" \
  --volume "/var/run/docker.sock:/var/run/docker.sock" \
  dockersamples/visualizer
