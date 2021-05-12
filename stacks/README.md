## STATUS

This is a WIP that will evolve as I complete the course refresh.

## CLI help

pass `--help` to any command:
- `docker stack --help`
- `docker stack deploy --help`

docs - command line references are fantastic:
- ref docs are **hit or miss** so below I link to the gold (stuff beyond what you get in the builtin CLI `--help`)
- management commands that are swarm specific/originated:
  - [docker service](https://docs.docker.com/engine/reference/commandline/service/)
  - [docker stack](https://docs.docker.com/engine/reference/commandline/stack/)
  - [docker swarm](https://docs.docker.com/engine/reference/commandline/swarm/)
  - [docker node](https://docs.docker.com/engine/reference/commandline/node/)
  - [docker config](https://docs.docker.com/engine/reference/commandline/config/)
  - [docker secret](https://docs.docker.com/engine/reference/commandline/secret/)
- management commands, universally applicable to both `standalone nodes` and `swarms`:
  - [docker network](https://docs.docker.com/engine/reference/commandline/network/)
    - TODO overlay driver, other options specific to swarms (ingress option, attachable)
    - TODO docker network inspect
  - TODO 
    - [docker volume](https://docs.docker.com/engine/reference/commandline/volume/)
    - TODO docker volume inspect

## Stacks

[`docker stack deploy -c mystack.yml STACK`](https://docs.docker.com/engine/reference/commandline/stack_deploy/)
- **create AND! update** a stack
- [examples](https://docs.docker.com/engine/reference/commandline/stack_deploy/#examples)

[`docker stack ls`](https://docs.docker.com/engine/reference/commandline/stack_ls) 
- list stacks
- [list formatting](https://docs.docker.com/engine/reference/commandline/stack_ls/#formatting)

[`docker stack services STACK`](https://docs.docker.com/engine/reference/commandline/stack_services)
- list services in a stack
- [filtering](https://docs.docker.com/engine/reference/commandline/stack_services/#filtering)
- [formatting](https://docs.docker.com/engine/reference/commandline/stack_services/#formatting)

[`docker stack ps STACK`](https://docs.docker.com/engine/reference/commandline/stack_ps/)
- list all tasks for all services in the stack 
- [filtering](https://docs.docker.com/engine/reference/commandline/stack_ps/#filtering)
- [formatting](https://docs.docker.com/engine/reference/commandline/stack_ps/#formatting)

[`docker stack rm STACK...`](https://docs.docker.com/engine/reference/commandline/stack_rm/)
- removing a stack (cleanup), equivalent to `docker-compose down` and `vagrant destroy`


## stack.yaml compose specifications

- docker stack deploy "supports" new [compose-spec](https://github.com/compose-spec/compose-spec)
  - [compose-spec schema](https://github.com/compose-spec/compose-spec/blob/master/schema/compose-spec.json)
- some of the docker docs compose ref have yet to be ported to compose-spec in which case perusing the command ref docs for **scenarios is especially useful**, i.e.:
  - [sample placement constraints](https://docs.docker.com/engine/reference/commandline/service_create/#specify-service-constraints---constraint)
  - [myriad of service options](https://docs.docker.com/engine/reference/commandline/service_create)
  - same is true of networks, volumes, secrets, configs, ...
- the v3 versioned compose file ref also provides **invaluable examples**:
  - https://docs.docker.com/compose/compose-file/compose-file-v3/#deploy


## Services

[`docker service create`](https://docs.docker.com/engine/reference/commandline/service_create/)
- this is the **holy grail of reference documentation for service options** 
  - whether calling [`docker service create`](https://docs.docker.com/engine/reference/commandline/service_create/) 
  - or writing a stack file for use with [`docker stack deploy`](https://docs.docker.com/engine/reference/commandline/stack_deploy/), take note deploy docs are thin (don't mention options in stack file).
- invaluable analogies:
  - `docker container run` ~= `docker service create` 
    - `containers` ~= `services` (hence overwhelming similarity in config options) 
    - **imperative commands** to create/update/remove services (also networks, volumes, and all other stack objects)
  - `docker-compose up` ~= `docker stack deploy`
    - `docker-compose.yaml` ~= `stack.yaml`
    - **Declarative app model** - current state is compared to desired state in model (yaml file) and differences are reconciled by mapping to imperative changes much like the imperative commands you could run yourself to reconcile changes "by hand". 
    - compose projects ~= stack instances

[`docker service ls`](https://docs.docker.com/engine/reference/commandline/service_ls/)
- [examples](https://docs.docker.com/engine/reference/commandline/service_ls/#examples)
- [filtering](https://docs.docker.com/engine/reference/commandline/service_ls/#filtering)
- [formatting](https://docs.docker.com/engine/reference/commandline/service_ls/#formatting)


[`docker service inspect`](https://docs.docker.com/engine/reference/commandline/service_inspect/)

[`docker service logs SERVICE|TASK`](https://docs.docker.com/engine/reference/commandline/service_logs/)
- [explanation](https://docs.docker.com/engine/reference/commandline/service_logs/#extended-description)
- [options](https://docs.docker.com/engine/reference/commandline/service_logs/#options)

[`docker service ps`](https://docs.docker.com/engine/reference/commandline/service_ps/)

[`docker service rm [NAME]`](https://docs.docker.com/engine/reference/commandline/service_rm/)

[`docker service rollback`](https://docs.docker.com/engine/reference/commandline/service_rollback/)

[`docker service scale`](https://docs.docker.com/engine/reference/commandline/service_scale/)

[`docker service update`](https://docs.docker.com/engine/reference/commandline/service_update/)

## Nodes

[`docker node rm`](https://docs.docker.com/engine/reference/commandline/node_rm/)

Viewing node status:
- [`docker node ls`](https://docs.docker.com/engine/reference/commandline/node_ls/)
- [`docker node inspect self|[NODE]`](https://docs.docker.com/engine/reference/commandline/node_inspect/)
  - [formatting](https://docs.docker.com/engine/reference/commandline/node_inspect/#specify-an-output-format)
  - [API NodeUpdate docs can help understand inspect output](https://docs.docker.com/engine/api/v1.41/#operation/NodeUpdate)
- [`docker node ps [NODE...]`](https://docs.docker.com/engine/reference/commandline/node_ps/)
  - list tasks by node(s)

Promote to manager, demote to worker
- [`docker node demote`](https://docs.docker.com/engine/reference/commandline/node_demote/)
- [`docker node promote`](https://docs.docker.com/engine/reference/commandline/node_promote/)

General updates to a node (i.e. role, labels)
- [`docker node update`](https://docs.docker.com/engine/reference/commandline/node_update/)

## Misc helpful docs

- [Docker object labels](https://docs.docker.com/config/labels-custom-metadata/)

## Wild Speculation from Wes

- someday, the rewrite of the [python based `docker-compose`](https://github.com/docker/compose) into the [go based `docker compose`](https://docs.docker.com/engine/reference/commandline/compose/) (aka [`Compose CLI`](https://github.com/docker/compose-cli)) may support what [`docker stack deploy`](https://docs.docker.com/engine/reference/commandline/stack_deploy/) does with very few (if any) differences. I wouldn't imagine this being much of a change beyond the CLI command to call with the same `stack.yaml` file.
  - [`docker app`](https://docs.docker.com/engine/reference/commandline/app/) is also in the works but I have a hunch it's all getting merged and likely under the compose branding.
  - many cooks in the compose kitchen! :) (not necessarily a bad thing)
