#!/usr/bin/env bash

# provisioner to be run on m1

# init m1 as first manager
# this will fail if run a second time
docker swarm init --advertise-addr 192.168.99.101

# write out just the token
docker swarm join-token -q worker > /vagrant/worker.token 
docker swarm join-token -q manager > /vagrant/manager.token 
