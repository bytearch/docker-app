#!/usr/bin/env bash

docker network create --driver bridge  --subnet=172.30.1.0/24 --gateway=172.30.1.1 --opt "com.docker.network.bridge.name"="app-network" app-network