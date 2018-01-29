#!/bin/bash
set -eo pipefail

if [ ! -f /data/devcoin/devcoin.conf ]; then
  echo "server=1
  maxconnections=${MAX_CONNECTIONS}
  rpcuser=${RPC_USER}
  rpcpassword=${RPC_PASS}
  rpcallowip=${RPC_ALLOW_IP}
  rpcport=${RPC_PORT}
  port=${PORT}
  txindex=1" > /data/devcoin/devcoin.conf
fi

exec "$@"
