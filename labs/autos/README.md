# autos - self-bootstrapping swarm

## Instructions

- create m1 first: `vagrant up m1` 
  - through to `docker swarm init` completing
  - creates /vagrant/worker.token & /vagrant/manager.token
  - now the rest are ready to be created
- create rest of VMs in whatever order
  - in parallel is best! `vagrant up --parallel`
    - assuming your provider supports it
    - otherwise `vagrant up` for the rest
  - each reads respective /vagrant/*.token and joins network 
- fully automate batch the commands:
  - `vagrant up m1 && vagrant up --parallel`
## Notable features

- IP addresses adjusted to avoid conflicts with `vagrants` VMs
  - note `10`/`11` similarity in IP & port prefixes
  - vs `20`/`21` with `vagrants` VMs
- added static localhost ports for ssh (port forwarding) 
  - avoid conflict from port collission & port reassigns
  - means ssh config will never change so you can run setup once and forget about it
  - nuke ssh config when you're done with the course/labs
