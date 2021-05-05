#!/usr/bin/env bash

echo '1. ~/.ssh/config.d/vagrant_swarmgs'
cat ~/.ssh/config.d/vagrant_swarmgs 
echo

echo '2. matching docker contexts'
docker context list | grep "^[wm]\d*"
echo