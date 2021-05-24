#!/usr/bin/env bash

# provisioner to be run on all `w` nodes (w1+)

_workerToken=$(</vagrant/worker.token) 

docker swarm join --token ${_workerToken} 192.168.99.101
