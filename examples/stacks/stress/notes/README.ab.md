## `ab` in `httpd`

`httpd` is the official repository of images for `apache` which includes `ab` which is the **Apache HTTP server benchmarking tool**.

### Determining how to run `ab` from `httpd` apache image

- First, determine what `httpd` is configured to run by default by inspecting image config.
  - `docker image pull httpd`
  - `docker image inspect httpd`
  - notice: 
    - `ENTRYPOINT` is NOT set
    - `CMD` is set
- So, just pass command + args (`ab ...`) to override CMD from image config
  - `docker service create [OPTIONS] IMAGE [COMMAND] [ARG...]`
  - run `docker service create --help` to find above syntax and options
  
