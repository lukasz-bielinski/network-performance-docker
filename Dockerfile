FROM oberthur/docker-ubuntu:16.04
MAINTAINER Lukasz Bielinski <l.bielinski@oberthur.com>

# Prepare image
RUN apt-get update  \
    && apt-get upgrade -y  \
    && apt-get install iperf3 curl gcc make libc6-dev \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN curl -LO ftp://ftp.netperf.org/netperf/netperf-2.7.0.tar.gz && tar -xzf netperf-2.7.0.tar.gz
RUN cd netperf-2.7.0 && ./configure --prefix=/usr && make && make install

ENTRYPOINT ["iperf3"]
