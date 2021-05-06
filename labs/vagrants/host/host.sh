#!/usr/bin/env bash

echo '1. query running vms via vagrant status'
running_vms=$(vagrant status --machine-readable | grep 'state,running' | cut -d',' -f2 | sort | uniq)
running_vms_space_delimited=${running_vms[@]}
echo '  running: '${running_vms_space_delimited}

echo '2. write vagrant ssh config options for faster, native/direct ssh access to running vms'
vagrant ssh-config ${running_vms_space_delimited} > ~/.ssh/config.d/vagrant_swarmgs
echo

echo '3. remove existing contexts starting with `w` or `m`'
docker context rm $(docker context list -q | grep '^[wm]')
echo 

echo '4. adding docker ssh contexts for running vms'
for vm in $running_vms; do 
  docker context create \
    --docker "host=ssh://$vm" \
    --default-stack-orchestrator swarm \
    $vm
done
echo
