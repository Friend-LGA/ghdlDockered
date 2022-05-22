# syntax=docker/dockerfile:1
FROM ubuntu:22.04
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="Europe/UTC"
RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential git gnat libz-dev
RUN git clone --recursive https://github.com/ghdl/ghdl.git
WORKDIR /ghdl
RUN ./configure
RUN make
RUN make install
WORKDIR /workdir
ENTRYPOINT ["ghdl"]
