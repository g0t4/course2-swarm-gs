#!/usr/bin/env bash

_network="echor_default"

icdiff \
  --whole-file \
  --label "docker network inspect ${_network}" \
  <(docker network inspect ${_network}) \
  --label "docker network inspect --verbose ${_network}" \
  <(docker network inspect --verbose ${_network})
