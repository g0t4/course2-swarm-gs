#!/usr/bin/env zsh


_cmd="docker service ls; echo; echo; docker service ps $1"
watch -n0.5 -d $_cmd
