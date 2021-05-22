#!/usr/bin/env bash

echo "## check if ssh config partial exists:"
stat ~/.ssh/config.d/vagrant_swarmgs
echo

echo "## list docker contexts"
docker context list --format "table {{.Name}}	{{.StackOrchestrator}}	{{.DockerEndpoint}}	{{.Description}}"
