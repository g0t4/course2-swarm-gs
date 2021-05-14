#!/usr/bin/env bash

echo '[WHAT] check if ssh config setup'
stat ~/.ssh/config.d/vagrant_swarmgs
echo

echo '[WHAT] docker context list'
docker context list --format "table {{.Name}}	{{.StackOrchestrator}}	{{.DockerEndpoint}}	{{.Description}}"
