#!/usr/bin/env bash

echo '## find running VMs'
running_vms=( $(vagrant status --machine-readable | grep 'state,running' | cut -d',' -f2 | sort | uniq) )

running_vms_spaced=${running_vms[@]}

echo '## config native ssh access via `vagrant ssh-config`'
echo '## b/c faster & docker ssh context needs it'
vagrant ssh-config $running_vms_spaced > ~/.ssh/config.d/vagrant_swarmgs

echo '## ignore already exists warning, this is idempotent'
echo '## or just run host-cleanup.sh first'
for vm in $running_vms_spaced; do
  docker context create \
    --docker "host=ssh://$vm" \
    --default-stack-orchestrator swarm \
    $vm
done
