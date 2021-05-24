# scripts

- all files in the vagrant environment (folder of `Vagrantfile` and nested folders) are available at `/vagrant` (a `shared folder`, vagrant parlance). For example, `/vagrant/scripts/`

## `provision` scripts - to auto bootstrap a swarm!

These scripts are configured for vagrant to run during `provisioning` (usually done on first boot only unless you're testing changes or new scripts) by vagrant. When and where is configured in the `Vagrantfile`.

## examples

The rest of the scripts are for learning, run them to follow along.

Remember:
- `vagrant ssh m1` or whatever VM you want is the easiest way 
  - help: `vagrant help ssh`
- if you have it setup:
  - `ssh m1` is faster
  - `docker -c m1` is most transparent
- ssh has `ssh -c` to run one-off commands too
- all operate over ssh!
