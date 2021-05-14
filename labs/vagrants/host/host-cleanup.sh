#!/usr/bin/env bash

rm ~/.ssh/config.d/vagrant_swarmgs 

_vms=( $(vagrant status --machine-readable | cut -d',' -f2 | sort | uniq) )

docker context rm -f "${_vms[@]}"

