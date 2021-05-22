#!/usr/bin/env bash

echo '## find running VMs'
running_vms=( $(vagrant status --machine-readable | grep 'state,running' | cut -d',' -f2 | sort | uniq) )
running_vms_spaced=${running_vms[@]}
echo 

echo '## config native ssh access via `vagrant ssh-config`'
echo '##   native is faster'
echo '##   necessary for docker ssh context'
vagrant ssh-config $running_vms_spaced > ~/.ssh/config.d/autos_swarmgs
echo

echo '## creating docker contexts to running vms'
echo '## * ignore already exists warning *'
echo '##   or run host-cleanup.sh first'
for vm in $running_vms_spaced; do
  docker context create \
    --docker "host=ssh://$vm" \
    --default-stack-orchestrator swarm \
    $vm
done
