#!/usr/bin/env bash

# https://github.com/jeffkaufman/icdiff/releases
# pip install icdiff
# brew install icdiff
icdiff --whole-file \
  --no-headers \
  <(docker container run --help) \
  <(docker service create --help)
