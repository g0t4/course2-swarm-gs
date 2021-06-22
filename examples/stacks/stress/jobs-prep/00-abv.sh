docker service rm abv

docker service create \
  --name abv \
  --mode global-job \
  --hostname 'ab-version-{{.Node.Hostname}}-{{.Task.Slot}}' \
  httpd \
  ab -V
