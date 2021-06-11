#!/usr/bin/env zsh

icdiff --whole-file <(docker inspect $1 | jq '.[].Spec') <(docker inspect $1 | jq '.[].PreviousSpec')
