#!/usr/bin/env bash


echo '## all nodes: '
docker node ls \
  --format "table {{if .Self}}*{{else}} {{end}}{{.Hostname}}\t{{.Status}}\t{{.Availability}}\t{{.ManagerStatus}}\t{{.EngineVersion}}\t{{truncate .ID 6}}"

echo

echo '## all tasks:' 
docker service ps \
  --format "table {{.Name}}\t{{.Node}}\t{{.DesiredState}}\t{{.CurrentState}}\t{{.Error}}" \
  $(docker service ls -q)
