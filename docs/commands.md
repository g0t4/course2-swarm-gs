# Useful commands

## General Tools

- `watch` - repeat a command indefinitely
  - why? many nuances of state transition are missed without repeating a command and watching for the output to change
  - overlaps output so changes are obvious (especially small ones)
    - `-d` "flashes" differences to make them more noticeable
  - `-n NUM` set the interval or frequency of running the command

## Nodes

- Listing nodes (id, name, role, availability...)
  - `watch -n 1 -d docker node ls`


