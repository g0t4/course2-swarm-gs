#!/usr/bin/env bash

set -x

_scale=${1:-1}
_tmpfile=$(date -u +"%Y-%m-%dT%H_%M_%SZ").out

# this will block until convergence
docker service scale sr_web="${_scale}"

docker stack ps sr > $_tmpfile

# should notice some degree of decay in delay with increasing resources
ab -c 100 -n 1000 http://pi1.lan:3000/db_block_slow >> $_tmpfile
ab -c 100 -n 1000 http://pi1.lan:3000/db_block_slow >> $_tmpfile
ab -c 100 -n 1000 http://pi1.lan:3000/db_block_slow >> $_tmpfile

# probably won't see much improvement here as there is so little blocking
ab -c 100 -n 1000 http://pi1.lan:3000/customer-nodelay/1 >> $_tmpfile
ab -c 100 -n 1000 http://pi1.lan:3000/customer-nodelay/1 >> $_tmpfile
ab -c 100 -n 1000 http://pi1.lan:3000/customer-nodelay/1 >> $_tmpfile
