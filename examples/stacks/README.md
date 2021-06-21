## stacks

- [docker stack deploy - ref](https://docs.docker.com/engine/reference/commandline/stack_deploy/) - has a little bit of detail
- `docker service create --help` and `docker service update --help` are your friends too, especially their online docs

### What is accepted in a stack file?

- [Compose file version 3 reference](https://docs.docker.com/compose/compose-file/compose-file-v3/) - great detail about options/values & purpose, including `deploy` element which is hallmark of `v3` syntax
- [compose-spec](https://github.com/compose-spec/compose-spec/blob/master/spec.md) - is a good resource too but I find the originals to be more detailed (currently)
  - [compose-spec website](https://compose-spec.io/)

### Networking

- [Configuring the default network](https://docs.docker.com/compose/networking/#configure-the-default-network)
  - entire page is about [Networking in Compose](https://docs.docker.com/compose/networking/)
