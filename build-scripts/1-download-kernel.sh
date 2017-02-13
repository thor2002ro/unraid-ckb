#!/bin/sh

KERNEL_VERSION=${KERNEL_VERSION:-`uname -r | sed 's/-unRAID//g'`}

wget --no-check-certificate "https://www.kernel.org/pub/linux/kernel/v4.x/linux-${KERNEL_VERSION}.tar.xz" -O /usr/src/linux-${KERNEL_VERSION}.tar.xz
mkdir -p /usr/src/kernel
tar -C /usr/src/kernel --strip-components=1 -Jxf /usr/src/linux-${KERNEL_VERSION}.tar.xz

