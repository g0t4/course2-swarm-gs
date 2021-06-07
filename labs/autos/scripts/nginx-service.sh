docker service create \
    --publish "8200:80/tcp" \
    --name weby \
    --detach \
    nginx









## commands:

# watches should be run in VM for performance 
# or slow down frequency of checking (ie -n 2)
watch -t -d -n 0.5 'docker service ps --format "table {{.ID}}\t{{.Name}}\t{{.Node}}\t{{.DesiredState}}\t{{.CurrentState}}" weby'



docker service logs weby
