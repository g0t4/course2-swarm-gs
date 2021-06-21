docker service rm ab-slow 

docker service create \
  --name ab-slow \
  --mode replicated-job \
  --replicas 1 \
  --network sr_testers \
  httpd \
  ab -n 5000 -c 100 http://sr_web:3000/db_block_slow 
