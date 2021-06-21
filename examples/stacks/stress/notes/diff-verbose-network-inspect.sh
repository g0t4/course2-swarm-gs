#!/usr/bin/env bash


icdiff \
  --whole-file \
  --label "docker network inspect ingress" \
  <(docker network inspect ingress) \
  --label "docker network inspect --verbose ingress" \
  <(docker network inspect --verbose ingress)


# icdiff \
#   --whole-file \
#   --label "docker network inspect echor_default" \
#   <(docker network inspect echor_default) \
#   --label "docker network inspect --verbose echor_default" \
#   <(docker network inspect --verbose echor_default)
