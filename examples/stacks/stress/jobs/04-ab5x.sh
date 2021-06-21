docker service rm ab5x

docker service create \
  --name ab5x \
  --mode replicated-job \
  --replicas 5 \
  --network sr_testers \
  httpd \
  ab -n 1000 -c 100 http://sr_web:3000/customer-nodelay/1

echo "don't forget to scale the sr_web service as you see fit"
echo "service currently:"
docker service ls sr_web
