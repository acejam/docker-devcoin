# Devcoind for Docker

[![Docker Stars](https://img.shields.io/docker/stars/acejam/docker-devcoin.svg?maxAge=2592000)](https://hub.docker.com/r/acejam/docker-devcoin)
[![Docker Pulls](https://img.shields.io/docker/pulls/acejam/docker-devcoin.svg?maxAge=2592000)](https://hub.docker.com/r/acejam/docker-devcoin)

A customizable Docker container for Devcoin

## Quick Start

    docker run -d --name devcoin --restart=always -v /data/devcoin:/data/devcoin acejam/docker-devcoin

## Config options

This container includes support for Devcoin configuration values. These values can be set when calling `docker run` through the use of environment variables.

The following values are configurable:
* `RPC_USER`
* `RPC_PASS`
* `MAX_CONNECTIONS`
* `RPC_PORT`
* `PORT`

For example, to run the container with the username "DevUser" and a password of "P@ssw0rd123" with 10 max connections, you can run the following:

      dokcer run -d -e RPC_USER="DevUser" -e RPC_PASS="P@ssw0rd123" -e MAX_CONNECTIONS=10 acejam/docker-devcoin

## Data persistence

Coming soon!
