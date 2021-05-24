#!/usr/bin/env bash

# provisioner to be run on m2+

_managerToken=$(</vagrant/manager.token) 

docker swarm join --token ${_managerToken} 192.168.99.101
