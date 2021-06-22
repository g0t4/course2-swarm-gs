# clean up:
docker service rm ab1 abv

## 1 job => 1 server (slow endpoint)
docker service update \
  --replicas 1 \
  sr_web

# prepare to follow logs:
docker service logs onejob --follow

# launch test job
docker service create \
  --name onejob \
  --mode replicated-job \
  --replicas 1 \
  --network sr_testers \
  httpd \
  ab -n 1000 -c 100 http://sr_web:3000/db_block_slow


## scale up to 2 services (same test job)
docker service update \
  --replicas 2 \
  --replicas-max-per-node 1 \
  sr_web

docker service update --force onejob


## scale up to 5 services (same test job)
docker service update \
  --replicas 5 \
  --replicas-max-per-node 1 \
  sr_web

docker service update --force onejob
