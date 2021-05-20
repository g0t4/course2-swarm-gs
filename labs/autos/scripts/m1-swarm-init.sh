#!/usr/bin/env bash

# init m1 as first manager
# this will fail if run a second time
docker swarm init --advertise-addr 192.168.99.201

# write out just the token
docker swarm join-token -q worker > /vagrant/worker.token 
docker swarm join-token -q manager > /vagrant/manager.token 
