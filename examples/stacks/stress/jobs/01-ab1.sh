docker service rm ab1

docker service create \
  --name ab1 \
  --mode replicated-job \
  --replicas 1 \
  --network sr_testers \
  httpd \
  ab -n 100 -c 10 http://sr_web:3000/customer-nodelay/1

# FYI show how much faster this appears to be when run within the cluster! versus just a few switch hops away on my MBP (sub millisecond ping time too, so low latency)
# perhaps ping would be instrumental though too?
