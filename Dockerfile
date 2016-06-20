FROM ubuntu:14.04
MAINTAINER Joshua Noble <acejam@gmail.com>

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update && \
    apt-get install -y git wget curl openssl libssl-dev build-essential libdb4.8-dev libdb4.8++-dev libboost-all-dev

ARG RPC_PASS=password
ENV RPC_PASS=${RPC_PASS}
WORKDIR /root

RUN git clone https://github.com/coinzen/devcoin.git
RUN cd /root/devcoin/src && make -f makefile.unix USE_UPNP=-
RUN mv /root/devcoin/src/devcoind /usr/bin/devcoind

RUN mkdir -p /data/devcoin
RUN echo "server=1\n\
maxconnections=15\n\
rpcuser=devcoinrpc\n\
rpcpassword=${RPC_PASS}\n\
rpcallowip=127.0.0.1\n\
rpcport=53333\n\
port=63333\n\
txindex=1\n" >> /data/devcoin/devcoin.conf

EXPOSE 53333 63333
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["/usr/bin/devcoind", "-datadir=/data/devcoin", "-printtoconsole"]
