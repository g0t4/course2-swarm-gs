# maybe show curl works first (so not a dud request):
docker container run -i -t --rm \
  --network sr_testers \
  httpd \
  bash

echo run:
echo "apt-get update && apt-get install -y curl dnsutils"
echo "curl http://sr_web:3000/customer-nodelay/1"

# or use non apache image with some web client in it
echo optional:
echo dig sr_web
echo dig tasks.sr_web
