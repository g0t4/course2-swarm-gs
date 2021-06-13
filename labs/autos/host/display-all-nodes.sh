#!/usr/bin/env bash

echo '## all nodes: '
docker node ls \
  --format "table {{if .Self}}*{{else}} {{end}}{{.Hostname}}\t{{.Status}}\t{{.Availability}}\t{{.ManagerStatus}}\t{{.EngineVersion}}\t{{truncate .ID 6}}"
