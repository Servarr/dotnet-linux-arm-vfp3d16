FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y gpg curl wget software-properties-common && \
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null && \
    apt-add-repository 'deb https://apt.kitware.com/ubuntu/ focal main' && \
    apt-get update && \
    apt-get install -y cmake llvm-9 lld-9 clang-9 autoconf automake libtool build-essential python curl git lldb-6.0 liblldb-6.0-dev libunwind8 libunwind8-dev gettext libicu-dev liblttng-ust-dev libssl-dev libnuma-dev libkrb5-dev zlib1g-dev debootstrap qemu-user-static locales binfmt-support binutils-arm-linux-gnueabihf && \
    locale-gen "en_US.UTF-8"

ENV ROOTFS_DIR=/crossrootfs
