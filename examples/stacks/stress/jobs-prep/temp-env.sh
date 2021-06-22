echo 'env var templating'

set -x 

_service_name='temp-env'
docker service rm "${_service_name}"

docker service create \
  --name "${_service_name}"  \
  --mode replicated-job \
  --env SLOT="{{.Task.Slot}}" \
  --replicas 5 \
  httpd \
  bash -c 'env'

docker service logs "${_service_name}" 

echo 'optionally run:'
echo "docker inspect (docker service ps ${_service_name} -q)"
