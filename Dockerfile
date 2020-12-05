FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
  apt install -y cmake clang-format libgflags-dev googletest libgoogle-glog-dev build-essential && \
  dpkg -L googletest && cd /usr/src/googletest/ && cmake . && make && make install

# add user (vscode)
RUN useradd -m vscode && echo 'vscode:vscode' | chpasswd && usermod -aG sudo vscode && chsh -s /bin/bash vscode
RUN apt install -y git curl python wget unzip sudo gdb

RUN apt install -y libnuma-dev libpmem-dev librpmem-dev libpmemblk-dev libpmemlog-dev libpmemobj-dev libpmempool-dev libpmempool-dev
RUN ln -s /usr/lib/x86_64-linux-gnu/libpmemobj.so /usr/local/lib/libpmemobj.so
RUN ln -s /usr/lib/x86_64-linux-gnu/libpmemobj.a /usr/local/lib/libpmemobj.a

ENV DISPLAY host.docker.internal:0.0
