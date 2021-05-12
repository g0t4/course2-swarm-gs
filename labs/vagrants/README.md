## Commands

```bash

# built-in help
vagrant [subcommand subsub...] --help # most predictable way to get help
  # no args prints list of prominent subcommands
vagrant list-commands # list all commands, some are hidden

# create a subset of vms
vagrant up m1
vagrant up m*
vagrant up m1 m2 w1 
vagrant up w*
# create all vms
vagrant up

# shutdown vm(s)
vagrant halt
vagrant halt w* m1

# restart vm(s), reloading Vagrantfile changes
vagrant reload 
# or
vagrant halt
vagrant up # doesn't just create new VMs, turns on halted VMs too

# provisioners are run on the first boot, you can explicitly invoke provisioners after a VM is created:
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



```
