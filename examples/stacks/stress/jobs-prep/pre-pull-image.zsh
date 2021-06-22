#!/usr/bin/env zsh

for i in {1..5}; docker -c "pi${i}" image pull httpd
