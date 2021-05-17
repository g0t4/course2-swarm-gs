# Host Scripts

These are to setup a few things:
1. generate and save "native" `ssh` `config` (options) to access the vagrant VMs without `vagrant ssh` which is **faster** and **convenient** for sleuthing around the VMs. And, ...
2. ... `ssh` config is necessary to create and use `ssh` based docker contexts to transparently and efficiently manage multiple nodes remotely (from the VM host in our case)
3. verify (before/after) the scripts are working by seeing changes in output of the verify script
4. cleanup (remove host access conveniences: "native" `ssh` config and docker based `ssh` contexts)

## host scripts (simplified)

Here are approximate scripts. Use these in the event you have trouble or don't want to use the included scripts. 

```shell

## host-setup.sh

# Assumption:
# echo 'Include config.d/*' >> ~/.ssh/config

# generate ssh config and persist to ~/.ssh/config indirectly
# specific VMs running:
vagrant ssh-config m1 w1 > ~/.ssh/config.d/vagrant_swarmgs
# all VMs running:
vagrant ssh-config > ~/.ssh/config.d/vagrant_swarmgs

# context create for all VMs:
docker context create --docker "host=ssh://m1" --default-stack-orchestrator swarm m1
docker context create --docker "host=ssh://m2" --default-stack-orchestrator swarm m2
docker context create --docker "host=ssh://m3" --default-stack-orchestrator swarm m3
docker context create --docker "host=ssh://w1" --default-stack-orchestrator swarm w1
docker context create --docker "host=ssh://w2" --default-stack-orchestrator swarm w2
docker context create --docker "host=ssh://w3" --default-stack-orchestrator swarm w3
docker context create --docker "host=ssh://w4" --default-stack-orchestrator swarm w4

## ~host-cleanup.sh

# remove all ssh config for VMs
rm ~/.ssh/config.d/vagrant_swarmgs 

# remove all contexts
docker context rm -f m1 m2 m3 w1 w2 w3 w4

```

