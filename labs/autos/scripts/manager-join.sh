#!/usr/bin/env bash

_managerToken=$(</vagrant/manager.token) 

docker swarm join --token ${_managerToken} 192.168.99.101
