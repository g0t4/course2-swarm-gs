echo 'understanding how templating (hostname) works with jobs'

set -x 

_service_name='temp-hostname'
docker service rm "${_service_name}"

docker service create \
  --name "${_service_name}"  \
  --mode replicated-job \
  --hostname "${_service_name}-{{.Node.Hostname}}-{{.Task.Slot}}" \
  --replicas 5 \
  httpd \
  bash -c 'hostname'

docker service logs "${_service_name}"

echo 'optionally run:'
echo "docker inspect (docker service ps ${_service_name} -q)"
