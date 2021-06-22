# have this ready to go in right panel
docker service logs testy --follow

# run these in left panel (clearing right panel as desired)
docker service create \
  --name testy \
  --mode replicated-job \
  --network sr_testers \
  weshigbee/swarmgs2-webstress \
    dig sr_web

# scale up, does what?! :)
docker service scale \
  testy=3

# scale down...
docker service scale \
  testy=1

# inspect endpoint
docker service update \
  --args "bash -c 'curl http://sr_web:3000/inspect; ip a s' " \
  testy
  
# no delay endpoint
docker service update \
  --args "curl http://sr_web:3000/customer-nodelay/1" \
  testy
