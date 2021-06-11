## viz examples

A spectrum of examples 
- from `docker container run` as a `standalone container`
  - to `docker service create` as a `swarm service`
  - to `docker compose` as a `standalone compose project/app`
  - to `docker stack deploy` as a `swarm stack`!
- this progression is 
  - increasingly declarative 
  - and decreasingly imperative (yes that's redundant 😉)
  - I could say `docker container run` is the imperative approach, 
    - and while it is the most imperative of the bunch, 
    - it has features like a restart policy that leans towards declarative (make sure I'm ______ running) with a smidge of a desired state enforcement. 
    - And, declarative is largely about what not how and with that alone we have to admit containers are a very high level abstraction with many underpinnings determined by the container runtime and thus there isn't really an imperative approach above
      - There are variants of a declarative model with or without desired state reconciliation. 
    - And `services` are highly declarative regardless how they are created and updated.
    - stacks arugably make the process of creating and maintaining services (all resources in a stack) declarative too!

## About the image behind viz (dockersamples/visualizer)

- source: [`dockersamples/docker-swarm-visualizer`](https://github.com/dockersamples/docker-swarm-visualizer)
  - built with javascript, easily modified
- image: [`dockersamples/visualizer`](https://hub.docker.com/r/dockersamples/visualizer)

## My fork and cross compiled image

- fork: [`g0t4/docker-swarm-visualizer`](https://github.com/g0t4/docker-swarm-visualizer)
- image: [`weshigbee/swarmgs2-viz`](https://hub.docker.com/r/weshigbee/swarmgs2-viz)
- platforms: `linux/amd64`, `linux/arm64`, `linux/arm/v7`, `linux/arm/v6`
   - translation, it just works on rpi (tested on rpi4) :) 
- inspect commands:
  ```shell
  # list tags/platforms with `hub-tool`:
  hub-tool tag ls --platforms weshigbee/swarmgs2-viz
  # json formatted + jq pretty print and syntax highlight:
  hub-tool tag ls --platforms --format json weshigbee/swarmgs2-viz | jq
   
  # inspect  manifest list for supported platforms
  docker buildx imagetools inspect weshigbee/swarmgs2-viz \
    | bat -l yaml
  # bat is optional, a general purpose syntax highlighter
  ```

