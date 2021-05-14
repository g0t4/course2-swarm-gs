#!/usr/bin/env bash

echo '[WHAT] Find running vagrant vms...'
running_vms=$(vagrant status --machine-readable | grep 'state,running' | cut -d',' -f2 | sort | uniq)
running_vms_space_delimited=${running_vms[@]}
echo '[INFO] found: '${running_vms_space_delimited}
echo

_ssh_config_file="~/.ssh/config.d/vagrant_swarmgs"
echo "[WHAT] vagrant ssh-config > ${_ssh_config_file}"
echo "[ WHY] faster native ssh access to VMs vs `vagrant ssh`"
echo "[ WHY] needed for docker context to dockerd on VMs"
vagrant ssh-config ${running_vms_space_delimited} > "${_ssh_config_file}" 
echo

echo '[WHAT] docker context create ssh to VM dockerd(s)'
echo '[ FYI] ignore already created message, this is idempotent'
for vm in $running_vms; do
  docker context create \
    --docker "host=ssh://$vm" \
    --default-stack-orchestrator swarm \
    $vms
done
