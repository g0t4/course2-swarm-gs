#!/usr/bin/env bash

echo '1. query running vms via vagrant status'
running_vms=$(vagrant status --machine-readable | grep 'state,running' | cut -d',' -f2 | sort | uniq)
running_vms_space_delimited=${running_vms[@]}
echo '  running: '${running_vms_space_delimited}

vagrant ssh-config ${running_vms_space_delimited} > ~/.ssh/config.d/vagrant_swarmgs

echo '2. remove existing contexts, thus nuking dangling contexts (vms not running) and can just assume create instead of conditional update'
docker context rm $(docker context list -q | grep '^[wm]')
echo 
echo '3. adding docker ssh contexts to vms'
for vm in $running_vms; do 
  docker context create \
    --docker "host=ssh://$vm" \
    --default-stack-orchestrator swarm \
    $vm
done
