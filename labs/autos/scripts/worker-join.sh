#!/usr/bin/env bash

_workerToken=$(</vagrant/worker.token) 

docker swarm join --token ${_workerToken} 192.168.99.101
