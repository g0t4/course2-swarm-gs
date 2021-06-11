#!/usr/bin/env zsh


# watches should be run in VM for performance 
#   or slow down frequency of checking (ie -n 2)
_cmd="docker service ls; echo; echo; docker service ps $1"
watch -n0.5 -d $_cmd
