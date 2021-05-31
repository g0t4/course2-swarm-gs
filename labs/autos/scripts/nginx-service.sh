docker service create \
    --publish "8200:80/tcp" \
    --name weby \
    --detach \
    nginx
