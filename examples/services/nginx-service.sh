## Create nginx service

docker service create \
    --publish "8200:80/tcp" \
    --name weby \
    --detach \
    nginx


# Watch weby task changes

# - watches should be run in VM for performance 
#   - or slow down frequency of checking (ie -n 2)
watch -t -d -n 0.5 'docker service ps --format "table {{.ID}}\t{{.Name}}\t{{.Node}}\t{{.DesiredState}}\t{{.CurrentState}}" weby'


## Remove service

docker service rm weby


## Service logs (containers)

docker service logs weby


## Scale service

docker service scale weby=6
# scale is shorthand for `update --replicas` 
docker service update --replicas=6 weby

