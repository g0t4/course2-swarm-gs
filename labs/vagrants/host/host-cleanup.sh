#!/usr/bin/env bash

echo "## removing native ssh config to VMs"
rm ~/.ssh/config.d/vagrant_swarmgs 
echo

echo "## finding all VM names"
_vms=( $(vagrant status --machine-readable | cut -d',' -f2 | sort | uniq) )
echo

echo "## removing all docker contexts for VMs"
docker context rm -f "${_vms[@]}"

