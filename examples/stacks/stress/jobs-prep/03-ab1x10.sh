
docker service rm ab1x10

docker service create \
  --name ab1x10 \
  --mode replicated-job \
  --replicas 1 \
  --network sr_testers \
  httpd \
  ab -n 1000 -c 100 http://sr_web:3000/customer-nodelay/1
