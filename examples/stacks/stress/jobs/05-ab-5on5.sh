docker service rm ab5on5

docker service update \
  --replicas-max-per-node 1 \
  --replicas 5 \
  sr_web

docker service create \
  --name ab5on5 \
  --mode global-job \
  --network sr_testers \
  httpd \
  ab -n 1000 -c 20 http://sr_web:3000/customer-nodelay/1
