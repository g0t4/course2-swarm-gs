## `host-\*` scripts

see notes in [vagrants host scripts README](../../vagrants/host/README.md)

- FYI the names of machines m1 and w1 are going to collide if you try to use both environments at the same time, I'd just avoid it or change the defined machine names, to maybe "am" and "aw" or auto manager/worker, or something else.

## `display-*` scripts

- run from docker host for performance
  - or decrease watch `-n` interval
- use `time` to determine fastest frequency **(per environment)**
- watch's `-n` usually is limited to a minimum of `0.1` seconds
- change `display-*` script as desired

```bash
$ watch -d -n0.5 --no-title /vagrant/host/display-node_task.sh
```
