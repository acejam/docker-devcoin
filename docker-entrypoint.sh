#!/bin/bash
set -eo pipefail

echo "server=1
maxconnections=${MAX_CONNECTIONS}
rpcuser=${RPC_USER}
rpcpassword=${RPC_PASS}
rpcallowip=127.0.0.1
rpcport=53333
port=63333
txindex=1" > /data/devcoin/devcoin.conf

exec "$@"
