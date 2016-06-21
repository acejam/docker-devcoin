FROM ubuntu:14.04
MAINTAINER Joshua Noble <acejam@gmail.com>

ENV RPC_USER devcoinrpc
ENV RPC_PASS P@ssw0rd
ENV MAX_CONNECTIONS 15
WORKDIR /root

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:bitcoin/bitcoin

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-test-dev \
    libboost-thread-dev \
    libdb4.8-dev \
    libdb4.8++-dev \
    libssl-dev

RUN git clone https://github.com/coinzen/devcoin.git && \
    cd /root/devcoin/src && \
    make -f makefile.unix USE_UPNP=- && \
    mv /root/devcoin/src/devcoind /usr/bin/devcoind && \
    mkdir -p /data/devcoin

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 53333 63333
VOLUME ["/data/devcoin"]
CMD ["/usr/bin/devcoind", "-datadir=/data/devcoin", "-printtoconsole"]
