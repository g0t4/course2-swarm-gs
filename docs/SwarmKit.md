## SwarmKit

Note: Work in Progress

## What is SwarmKit?

- SwarmKit is the toolkit embedded in the Docker Engine client and daemon to provide Swarm (clustering) functionality. 
- SwarmKit has its own standalone CLI interfaces with `swarmd` (hint: `dockerd`) and `swarmctl` (hint: compare this to the `docker` CLI's swarm management commands).  

## SwarmKit Resources

- [docker/swarmkit repository](https://github.com/docker/swarmkit)
  - Filled with gems for understanding Docker Swarm mode, i.e. code comments in the SwarmKit repo.
  - [ ] Clone this to your workstation for reference while learning about Docker Swarm.
- [SwarmKit's README](https://github.com/docker/swarmkit/blob/master/README.md) is filled with great explanations of terminology, features, protocols, etc. 
  - [ ] Just Read It!

### API Specs

- [api/specs.proto](https://github.com/docker/swarmkit/blob/master/api/specs.proto)
- [What is a Spec](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L11-L19)?
  - Specs are the primary means of creating and updating objects
  - Or, how **desired state** is expressed!
- [ ] **Use as a reference** when inspecting Swarm objects, i.e.
- Note the prevalence of comments that explain things like Node [Availability](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L31), specifically what happens with a [paused node](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L37-L39)
- [ServiceSpec](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L57-L63)
  - [ServiceSpec.mode](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L69-L74)
    - [GlobalService](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L99-L100)
    - [ReplicatedService](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L94-L95)
    - [GlobalJob](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L118-L120)
    - [ReplicatedJob](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L104-L106)
  - [EndpointSpec](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L375-L377)
  - [TaskSpec](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L124)
    - [ContainerSpec](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L185-L186)
- [SecretSpec](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L475-L476)
- [ConfigSpec](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L493-L494)
- [NetworkSpec](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L406-L407)
  - [NetworkAttachmentSpec](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L176-L178)
- [ClusterSpec](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L447-L448)
  - [NodeSpec](https://github.com/docker/swarmkit/blob/5a5494a9a7b408b790533a5e4e1cb43ca1c32aad/api/specs.proto#L21)

### API objects

- [API Objects](https://github.com/docker/swarmkit/blob/master/api/objects.proto)
  - Also great comments explaining terms that are hard to find defined elsewhere that surface in Docker Swarm interfaces.

## Related Resources

- Learning about the [Raft Consensus Algorithm](https://raft.github.io/), [think "awesome-raft" repo](https://github.com/raft/raft.github.io).
