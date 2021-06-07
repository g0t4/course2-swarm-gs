docker service create \
    --publish "8200:80/tcp" \
    --name weby \
    --detach \
    nginx









## Watching the weby service with a custom column format:
watch -t -d -n 0.5 'docker service ps --format "table {{.ID}}\t{{.Name}}\t{{.Node}}\t{{.DesiredState}}\t{{.CurrentState}}" weby'
