## Pre-requisites

1. Install `vagrant`
2. Install `VirtualBox` or another hypervisor
3. If you don't use `VirutalBox` you'll need to provide the hypervisor to vagrant via - CLI arg: vagrant up **--provider <hypervisor>** 
- env var: `VAGRANT_PROVIDER`

## Commands

```bash

# [] = optional
# [name/pattern ...] = machine specifier (one or more, space delimited)

# built-in help
vagrant [subcommand subsubcommand ...] --help # most predictable way to get help
  # no args prints list of prominent subcommands
vagrant list-commands # list all commands, some are hidden
vagrant validate # check validity of Vagrantfile

# create a Vagrantfile
vagrant init [box] # includes tons of commented out sample configuration
vagrant init --minimal [box] # no commented out sample config
# recommend: use vagrant cloud boxes, i.e.:
vagrant init ubuntu/focal64

# create vms (all or a subset specified by the optional name/pattern argument)
vagrant up [name/pattern]
# examples of names/patterns: (applicable style in many commands)
vagrant up m1
vagrant up m*
vagrant up m1 m2 w1 
vagrant up w*

# shutdown vm(s)
vagrant halt [name/pattern]

# restart vm(s), reloading Vagrantfile changes
vagrant reload [name/pattern]
# or
vagrant halt [name/pattern]
vagrant up [name/pattern] # up doesn't just create new VMs, up turns on halted VMs too

# suspend a VM
vagrant suspend
vagrant resume

# provisioners are run after first boot
# to explicitly invoke provisioners after a VM is created:
vagrant provision # for running VMs
vagrant reload --provision/--with-provisioners x,y,z # restart then provision
vagrant up --provision # for created, but halted VMs

# cleanup
vagrant destroy [-f] [name/pattern] # wipe out VMs or a subset
  # -f silences the prompt to confirm

# fully test changes to a Vagrantfile
vagrant destroy -f
vagrant up

# connect to VM
vagrant ssh m1
vagrant ssh-config # print ssh config for bypassing vagrant and instead using host's ssh command

vagrant snapshot --help # read help for this
vagrant snapshot save/restore # named snapshots 
vagrant snapshot list/delete
vagrant snapshot push/pop # stack based snapshot storage

# VM status
vagrant status [name/pattern] # print status of VMs defined in working directory's Vagrantfile
vagrant global-status --prune # print status of all vagrant projects 
# manage boxes
vagrant box --help
vagrant box list # show a listing of all local boxes

```

## Notes

- FYI `vagrant ssh ..` works just fine for the entire course, no need to use contexts if they cause you any grief, just move no, it's a nicety is all.
- See [autos README](../autos/README.md) for more about static ssh ports change

## vagrant box selection 

- [`official ubuntu org`](https://app.vagrantup.com/ubuntu/) boxes chosen
- [ubuntu releases](https://wiki.ubuntu.com/Releases) 
- suggested alternate boxes (at time of recording):
  - 21.04: https://app.vagrantup.com/ubuntu/boxes/hirsute64
  - 20.04 (current LTS): ubuntu/focal64
  - 22.04 (next LTS): ubuntu/jj # NOT OUT YET

## relevant vagrant links

- docs: https://docs.vagrantup.com.
- box search: https://vagrantcloud.com/search.

## relevant docker links

- convenience install script: https://get.docker.com
- linux (engine) install docs: https://docs.docker.com/engine/install/
